// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginController, Store {
  Computed<bool> _$validateInputUsernameComputed;

  @override
  bool get validateInputUsername => (_$validateInputUsernameComputed ??=
          Computed<bool>(() => super.validateInputUsername,
              name: '_LoginController.validateInputUsername'))
      .value;
  Computed<bool> _$validateInputPasswordComputed;

  @override
  bool get validateInputPassword => (_$validateInputPasswordComputed ??=
          Computed<bool>(() => super.validateInputPassword,
              name: '_LoginController.validateInputPassword'))
      .value;

  final _$usernameAtom = Atom(name: '_LoginController.username');

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

  final _$passwordAtom = Atom(name: '_LoginController.password');

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

  final _$usernameValidAtom = Atom(name: '_LoginController.usernameValid');

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

  final _$passwordValidAtom = Atom(name: '_LoginController.passwordValid');

  @override
  bool get passwordValid {
    _$passwordValidAtom.reportRead();
    return super.passwordValid;
  }

  @override
  set passwordValid(bool value) {
    _$passwordValidAtom.reportWrite(value, super.passwordValid, () {
      super.passwordValid = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginController.loading');

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

  final _$errorLoginAtom = Atom(name: '_LoginController.errorLogin');

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

  final _$obscurePasswordAtom = Atom(name: '_LoginController.obscurePassword');

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

  final _$_LoginControllerActionController =
      ActionController(name: '_LoginController');

  @override
  dynamic setUsername(String username) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.setUsername');
    try {
      return super.setUsername(username);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String password) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.setPassword');
    try {
      return super.setPassword(password);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setObscurePassword() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.setObscurePassword');
    try {
      return super.setObscurePassword();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username},
password: ${password},
usernameValid: ${usernameValid},
passwordValid: ${passwordValid},
loading: ${loading},
errorLogin: ${errorLogin},
obscurePassword: ${obscurePassword},
validateInputUsername: ${validateInputUsername},
validateInputPassword: ${validateInputPassword}
    ''';
  }
}
