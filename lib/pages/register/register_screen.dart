import 'package:educap/pages/register/register_controller.dart';
import 'package:educap/pages/register/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _registerController = Modular.get<RegisterController>();

  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Cadastro',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => _registerController.showPage('/login'),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 75.0,
              ),
              RegisterForm(_scaffoldKey),
            ],
          ),
        ),
      ),
    );

    return scaffold;
  }
}
