import 'package:flutter/material.dart';

ThemeData getTheme(BuildContext context) {
  return ThemeData(
      primaryColor: Colors.indigo,
      accentColor: Colors.black12,
      buttonTheme: ButtonThemeData(
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          buttonColor: Colors.black12,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))));
}

TextStyle style = TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: 'Roboto Regular',
    fontSize: 20.0);

Widget getAppBar(String texto) {
  return AppBar(
    title: Text(
      texto,
      style: style.copyWith(
        color: Colors.white,
        fontSize: 18.0,
      ),
      textAlign: TextAlign.start,
    ),
    iconTheme: new IconThemeData(color: Colors.white),
    backgroundColor: Colors.indigo,
  );
}
