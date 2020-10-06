import 'package:educap/app/app_controller.dart';
import 'package:educap/pages/login/login_controller.dart';
import 'package:educap/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import "package:mobx/mobx.dart";
import 'package:progress_dialog/progress_dialog.dart';
part "home_controller.g.dart";

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  LoginController loginController = Modular.get<LoginController>();
  AppController appController = Modular.get<AppController>();
  ProgressDialog progressDialog;

  @observable
  bool productsLoading = true;

  logout() {
    this.appController.setUser(null);
    Constants.USER_TOKEN = null;
    this.showPage('/login');
  }

  void showPage(String route) {
    Modular.to.pushReplacementNamed(route);
  }

  hideProgressDialog() {
    this.progressDialog.hide();
  }

  showProgressDialog(BuildContext context) {
    if (progressDialog == null) {
      progressDialog = ProgressDialog(context, showLogs: true);
      progressDialog.style(
        message: " Aguarde ...",
        messageTextStyle: TextStyle(
            color: Colors.black45, fontSize: 14, fontWeight: FontWeight.normal),
        progressWidget: Padding(
          padding: EdgeInsets.all(12.0),
          child: CircularProgressIndicator(),
        ),
        elevation: 20.0,
      );
    }

    progressDialog.show();
  }
}
