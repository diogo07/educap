import 'package:educap/components/app_bar.dart';
import 'package:educap/components/inputs/layout.dart';
import 'package:educap/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginForm extends StatefulWidget {
  final scaffoldKey;

  LoginForm(this.scaffoldKey);

  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final LoginController _loginController = Modular.get<LoginController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _loginController.formKey,
        child: Theme(
          data: new ThemeData(
            primaryColor: Colors.greenAccent,
            primaryColorDark: Colors.black12,
          ),
          child: Column(
            children: <Widget>[
              Observer(
                builder: (_) =>
                    _loginController.loading != null && _loginController.loading
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    'Aguarde',
                                    style: TextStyle(color: Colors.black26),
                                  )),
                              Container(
                                margin: EdgeInsets.only(bottom: 40.0),
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.black12,
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Colors.greenAccent),
                                ),
                              )
                            ],
                          )
                        : Container(),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 50,
                padding: EdgeInsets.only(),
                child: TextFormField(
                  style: TextStyle(color: Colors.black38),
                  onChanged: _loginController.setUsername,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Preencha este campo';
                    }
                    return null;
                  },
                  decoration: _inputDecoration('Login'),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 60,
                padding: EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.black38),
                  onChanged: _loginController.setPassword,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Preencha este campo';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: _inputDecoration('Senha'),
                ),
              ),
              Observer(
                builder: (_) => _loginController.errorLogin
                    ? Container(
                        margin: EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        child: Text('Login ou senha inválida',
                            style: TextStyle(color: Colors.redAccent)),
                      )
                    : Container(),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
                width: MediaQuery.of(context).size.width / 1.2,
                child: RaisedButton(
                  child: Text(
                    "ENTRAR",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.greenAccent,
                  onPressed: _loginController.validateLogin,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 2, right: 32, bottom: 25),
                  child: Text('CADASTRE-SE',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      )),
                ),
              ),
            ],
          ),
        ));
  }

  _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.black12,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.greenAccent,
        ),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.greenAccent,
          )),
    );
  }
}
