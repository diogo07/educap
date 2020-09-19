import 'package:educap/pages/login/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 75.0,
              ),
              SizedBox(
                  height: 190.0,
                  width: 270.0,
                  child: Center(
                    child: Text(
                      'educap',
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontFamily: 'Assistant Bold',
                          fontSize: 40.0),
                    ),
                  )),
              LoginForm(_scaffoldKey),
            ],
          ),
        ),
      ),
    );

    return scaffold;
  }
}
