import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:progress_dialog/progress_dialog.dart';

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

///Definição do estilo da fonte
TextStyle style = TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: 'Roboto Regular',
    fontSize: 20.0);

///Função que retorna um AppBar com o texto passado como título
Widget getAppBar(String texto) {
  return AppBar(
    title: Text(
      texto,
      style: style.copyWith(
        color: Colors.white,
        fontSize: 16.0,
      ),
      textAlign: TextAlign.start,
    ),
    iconTheme: new IconThemeData(color: Colors.white),
    backgroundColor: Colors.indigo,
  );
}

///Função que retorna um menu com opções de Drawer

ProgressDialog pr;

///Função que retorna uma barra de carregamento
getProgressDialog(context) {
  pr = ProgressDialog(context, showLogs: true);
  pr.style(
    message: " Carregando...",
    progressWidget: CircularProgressIndicator(),
    elevation: 20.0,
  );

  pr.show();
}

class CustomProgressDialog extends StatelessWidget {
  ProgressDialog progressDialog;

  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(context, showLogs: true);
    progressDialog.style(
      message: " Carregando...",
      progressWidget: CircularProgressIndicator(),
      elevation: 20.0,
    );
  }

  void show() {
    progressDialog.show();
  }
}
