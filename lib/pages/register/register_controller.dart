import 'package:educap/app/app_controller.dart';
import 'package:educap/models/user.dart';
import 'package:educap/pages/home/home_controller.dart';
import 'package:educap/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import "package:mobx/mobx.dart";
import 'package:progress_dialog/progress_dialog.dart';
part "register_controller.g.dart";

class RegisterController = _RegisterController with _$RegisterController;

abstract class _RegisterController with Store {
  UserRepository userRepository = UserRepository();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AppController appController = Modular.get<AppController>();
  ProgressDialog progressDialog;
  @observable
  String firstName;

  @observable
  String lastName;

  @observable
  String username;

  @observable
  String password;

  @observable
  bool usernameValid = true;

  @observable
  bool loading;

  @observable
  bool errorLogin = false;

  @observable
  bool errorRequest = false;

  @observable
  bool obscurePassword = false;

  @action
  setFirstName(String firstName) {
    this.firstName = firstName;
    this.errorLogin = false;
  }

  @action
  setLastName(String lastName) {
    this.lastName = lastName;
    this.errorLogin = false;
  }

  @action
  setUsername(String username) {
    this.username = username;
    this.errorLogin = false;
    this.loginIsValid();
  }

  @action
  setPassword(String password) {
    this.password = password;
    this.errorLogin = false;
  }

  @action
  setUsernameValid(bool value) {
    this.usernameValid = value;
  }

  @action
  setObscurePassword() {
    this.obscurePassword = !this.obscurePassword;
  }

  showPage(String route) {
    Modular.to.pushReplacementNamed(route);
  }

  saveUser(BuildContext context) async {
    if (this.formKey.currentState.validate()) {
      this.showProgressDialog(context);
      try {
        await userRepository.save(User.full(
            this.firstName, this.lastName, this.username, this.password));
        User user = await userRepository.login(this.username, this.password);
        this.appController.setUser(user);
        this.progressDialog.hide();
        this.showPage('/home');
      } on Exception catch (error) {
        print(error.toString());
      }
    }
  }

  loginIsValid() async {
    if (this.username.trim().length > 0) {
      try {
        this.setUsernameValid(
            await userRepository.loginAvailable(this.username));
      } on Exception catch (error) {
        print(error.toString());
      }
    }
  }

  showProgressDialog(BuildContext context) {
    if (progressDialog == null) {
      progressDialog = ProgressDialog(context, showLogs: true);
      progressDialog.style(
        message: " Carregando...",
        messageTextStyle: TextStyle(
            color: Colors.black45, fontSize: 14, fontWeight: FontWeight.normal),
        progressWidget: Padding(
          padding: EdgeInsets.all(12.0),
          child: CircularProgressIndicator(),
        ),
        elevation: 20.0,
      );
    }

    progressDialog.show();
  }
}
