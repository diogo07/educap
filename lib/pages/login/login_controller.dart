import 'package:educap/models/user.dart';
import 'package:educap/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import "package:mobx/mobx.dart";
part "login_controller.g.dart";

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  UserRepository userRepository = UserRepository();
  User user = User.empty();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
  bool obscurePassword = false;

  validateLogin() async {
    this.errorLogin = false;
    if (this.formKey.currentState.validate()) {
      this.loading = true;
      try {
        user = await userRepository.login(this.username, this.password);
        if (user != null) {
          this.loading = false;
          Modular.to.pushReplacementNamed('/home');
        } else {
          this.loading = false;
          this.errorLogin = true;
        }
      } on Exception catch (_) {
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
