import 'package:educap/pages/profile/profile_controller.dart';
import 'package:educap/pages/profile/profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileScreen extends StatefulWidget {
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _profileController = Modular.get<ProfileController>();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Perfil',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => _profileController.showPage('/home'),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 25, bottom: 25),
                child: Text('ALTERAR INFORMAÇÕES',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold)),
              ),
              ProfileForm(_scaffoldKey),
            ],
          ),
        ),
      ),
    );

    return scaffold;
  }
}
