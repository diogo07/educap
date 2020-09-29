import 'package:educap/pages/login/login_controller.dart';
import 'package:educap/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterForm extends StatefulWidget {
  final scaffoldKey;

  RegisterForm(this.scaffoldKey);

  @override
  State<StatefulWidget> createState() {
    return _RegisterForm();
  }
}

class _RegisterForm extends State<RegisterForm> {
  final _registerController = Modular.get<RegisterController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _registerController.formKey,
        child: Theme(
          data: new ThemeData(
            primaryColor: Colors.indigo,
            primaryColorDark: Colors.black12,
          ),
          child: Column(
            children: <Widget>[
              Observer(
                builder: (_) => _registerController.loading != null &&
                        _registerController.loading
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
                                  Colors.indigo),
                            ),
                          )
                        ],
                      )
                    : Container(),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.black38),
                  onChanged: _registerController.setFirstName,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Preencha este campo';
                    }
                    return null;
                  },
                  decoration: _inputDecoration('Nome'),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.black38),
                  onChanged: _registerController.setLastName,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Preencha este campo';
                    }
                    return null;
                  },
                  decoration: _inputDecoration('Sobrenome'),
                ),
              ),
              Observer(
                builder: (_) => Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.black38),
                    onChanged: _registerController.setUsername,
                    validator: (value) {
                      if (value.isEmpty || !_registerController.usernameValid) {
                        return 'Login inválido';
                      }
                      return null;
                    },
                    decoration: _inputDecoration('Login'),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.black38),
                  onChanged: _registerController.setPassword,
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
                builder: (_) => _registerController.errorLogin
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
                width: MediaQuery.of(context).size.width * 0.9,
                child: RaisedButton(
                  child: Text(
                    "CADASTRAR",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.red[400],
                  onPressed: () => _registerController.saveUser(context),
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
          color: Colors.indigo,
        ),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.indigo,
          )),
    );
  }
}
