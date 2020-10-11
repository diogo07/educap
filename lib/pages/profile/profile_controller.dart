import 'package:educap/app/app_controller.dart';
import 'package:educap/models/user.dart';
import 'package:toast/toast.dart';
import 'package:educap/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import "package:mobx/mobx.dart";
import 'package:progress_dialog/progress_dialog.dart';
part "profile_controller.g.dart";

class ProfileController = _ProfileController with _$ProfileController;

abstract class _ProfileController with Store {
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

  updateUser(BuildContext context) async {
    if (this.formKey.currentState.validate()) {
      this.showProgressDialog(context);
      try {
        User user = User.full(
            this.firstName, this.lastName, this.username, this.password);
        user.id = this.appController.getUser().id;
        user = await userRepository.update(user);
        this.appController.getUser().first_name = user.first_name;
        this.appController.getUser().last_name = user.last_name;
        this.appController.getUser().username = user.username;
        this.progressDialog.hide();
        this.showMessage("Dados atualizados com sucesso!", context);
      } on Exception catch (error) {
        print(error.toString());
        this.showMessage("Erro ao atualizar as informações!", context);
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

  setDefaultDataUser() {
    this.username = this.appController.getUser().username;
    this.firstName = this.appController.getUser().first_name;
    this.lastName = this.appController.getUser().last_name;
    this.password = this.appController.getUser().password;
  }

  showMessage(String text, BuildContext context) {
    Toast.show(text, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }
}
