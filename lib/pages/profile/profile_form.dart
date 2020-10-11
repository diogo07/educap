import 'package:educap/pages/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileForm extends StatefulWidget {
  final scaffoldKey;

  ProfileForm(this.scaffoldKey);

  @override
  State<StatefulWidget> createState() {
    return _ProfileForm();
  }
}

class _ProfileForm extends State<ProfileForm> {
  final _profileController = Modular.get<ProfileController>();

  @override
  void initState() {
    this._profileController.setDefaultDataUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _profileController.formKey,
        child: Theme(
          data: new ThemeData(
            primaryColor: Colors.indigo,
            primaryColorDark: Colors.black12,
          ),
          child: Column(
            children: <Widget>[
              Observer(
                builder: (_) => _profileController.loading != null &&
                        _profileController.loading
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                'Aguarde',
                                style: TextStyle(
                                    color: Colors.black26, fontSize: 16),
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
                  style: TextStyle(color: Colors.black38, fontSize: 16),
                  initialValue:
                      _profileController.appController.getUser().first_name,
                  onChanged: _profileController.setFirstName,
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
                  style: TextStyle(color: Colors.black38, fontSize: 16),
                  initialValue:
                      _profileController.appController.getUser().last_name,
                  onChanged: _profileController.setLastName,
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
                    style: TextStyle(color: Colors.black38, fontSize: 16),
                    onChanged: _profileController.setUsername,
                    initialValue:
                        _profileController.appController.getUser().username,
                    validator: (value) {
                      if (value.isEmpty || !_profileController.usernameValid) {
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
                  style: TextStyle(color: Colors.black38, fontSize: 16),
                  onChanged: _profileController.setPassword,
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
                builder: (_) => _profileController.errorLogin
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
                    "SALVAR",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  color: Colors.red[400],
                  onPressed: () => _profileController.updateUser(context),
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
