import 'package:educap/models/user.dart';
import 'package:educap/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import "package:mobx/mobx.dart";
part "register_controller.g.dart";

class RegisterController = _RegisterController with _$RegisterController;

abstract class _RegisterController with Store {
  UserRepository userRepository = UserRepository();
  User user = User.empty();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
  }

  @action
  setPassword(String password) {
    this.password = password;
    this.errorLogin = false;
  }

  @action
  setObscurePassword() {
    this.obscurePassword = !this.obscurePassword;
  }

  showPage(String route) {
    Modular.to.pushReplacementNamed(route);
  }

  saveUser() async {}
}
