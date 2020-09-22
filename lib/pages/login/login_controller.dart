import 'package:educap/app/app_controller.dart';
import 'package:educap/models/user.dart';
import 'package:educap/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import "package:mobx/mobx.dart";
part "login_controller.g.dart";

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  UserRepository userRepository = UserRepository();
  AppController appController = Modular.get<AppController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String error = '';

  @observable
  String username;

  @observable
  String password;

  @observable
  bool usernameValid = true;

  @observable
  bool passwordValid = true;

  @observable
  bool loading;

  @observable
  bool errorLogin = false;

  @observable
  bool errorRequest = false;

  @observable
  bool obscurePassword = false;

  validateLogin() async {
    this.errorLogin = false;
    this.errorRequest = false;
    if (this.formKey.currentState.validate()) {
      this.loading = true;
      try {
        User user = await userRepository.login(this.username, this.password);
        this.appController.setUser(user);
        this.loading = false;
        Modular.to.pushReplacementNamed('/home');
      } on Exception catch (error) {
        this.error = error.toString();
        this.loading = false;
        this.errorLogin = true;
      }
    } else {
      if (!this.validateInputUsername) {
        this.usernameValid = false;
      }

      if (!this.validateInputPassword) {
        this.passwordValid = false;
      }
    }
  }

  showPage(String route) {
    Modular.to.pushReplacementNamed(route);
  }

  @computed
  bool get validateInputUsername {
    if (this.username == null) {
      return false;
    } else if (this.username.trim().length > 0) {
      return true;
    } else {
      return false;
    }
  }

  @computed
  bool get validateInputPassword {
    if (this.password == null) {
      return false;
    } else if (this.password.trim().length > 0) {
      return true;
    } else {
      return false;
    }
  }

  @action
  setUsername(String username) {
    this.username = username;
    this.usernameValid = true;
    this.errorLogin = false;
  }

  @action
  setPassword(String password) {
    this.password = password;
    this.passwordValid = true;
    this.errorLogin = false;
  }

  @action
  setObscurePassword() {
    this.obscurePassword = !this.obscurePassword;
  }
}
