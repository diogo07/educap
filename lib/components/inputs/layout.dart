import 'package:flutter/material.dart';

InputDecoration getInputDecoratorLogin(BuildContext context, String texto) {
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    labelText: texto,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: Color(0xFF4CAF50)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: Color(0xFF4CAF50)),
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Color(0xFF4CAF50))),
  );
}
