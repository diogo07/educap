import 'package:educap/models/user.dart';
import 'package:educap/pages/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import "package:mobx/mobx.dart";
part "home_controller.g.dart";

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  LoginController loginController = Modular.get<LoginController>();

  @observable
  bool productsLoading = true;

  @action
  setProductsLoading(bool value) {
    this.productsLoading = value;
  }

  void showPage(String route) {
    Modular.to.pushReplacementNamed(route);
  }
}
