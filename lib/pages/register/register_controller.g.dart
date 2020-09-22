// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterController, Store {
  final _$firstNameAtom = Atom(name: '_RegisterController.firstName');

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  final _$lastNameAtom = Atom(name: '_RegisterController.lastName');

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  final _$usernameAtom = Atom(name: '_RegisterController.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$passwordAtom = Atom(name: '_RegisterController.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$usernameValidAtom = Atom(name: '_RegisterController.usernameValid');

  @override
  bool get usernameValid {
    _$usernameValidAtom.reportRead();
    return super.usernameValid;
  }

  @override
  set usernameValid(bool value) {
    _$usernameValidAtom.reportWrite(value, super.usernameValid, () {
      super.usernameValid = value;
    });
  }

  final _$loadingAtom = Atom(name: '_RegisterController.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorLoginAtom = Atom(name: '_RegisterController.errorLogin');

  @override
  bool get errorLogin {
    _$errorLoginAtom.reportRead();
    return super.errorLogin;
  }

  @override
  set errorLogin(bool value) {
    _$errorLoginAtom.reportWrite(value, super.errorLogin, () {
      super.errorLogin = value;
    });
  }

  final _$errorRequestAtom = Atom(name: '_RegisterController.errorRequest');

  @override
  bool get errorRequest {
    _$errorRequestAtom.reportRead();
    return super.errorRequest;
  }

  @override
  set errorRequest(bool value) {
    _$errorRequestAtom.reportWrite(value, super.errorRequest, () {
      super.errorRequest = value;
    });
  }

  final _$obscurePasswordAtom =
      Atom(name: '_RegisterController.obscurePassword');

  @override
  bool get obscurePassword {
    _$obscurePasswordAtom.reportRead();
    return super.obscurePassword;
  }

  @override
  set obscurePassword(bool value) {
    _$obscurePasswordAtom.reportWrite(value, super.obscurePassword, () {
      super.obscurePassword = value;
    });
  }

  final _$_RegisterControllerActionController =
      ActionController(name: '_RegisterController');

  @override
  dynamic setFirstName(String firstName) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.setFirstName');
    try {
      return super.setFirstName(firstName);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLastName(String lastName) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.setLastName');
    try {
      return super.setLastName(lastName);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUsername(String username) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.setUsername');
    try {
      return super.setUsername(username);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String password) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.setPassword');
    try {
      return super.setPassword(password);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUsernameValid(bool value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.setUsernameValid');
    try {
      return super.setUsernameValid(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setObscurePassword() {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.setObscurePassword');
    try {
      return super.setObscurePassword();
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
firstName: ${firstName},
lastName: ${lastName},
username: ${username},
password: ${password},
usernameValid: ${usernameValid},
loading: ${loading},
errorLogin: ${errorLogin},
errorRequest: ${errorRequest},
obscurePassword: ${obscurePassword}
    ''';
  }
}
