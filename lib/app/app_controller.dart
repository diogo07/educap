import 'package:educap/models/user.dart';
import "package:mobx/mobx.dart";
part "app_controller.g.dart";

class AppController = _AppController with _$AppController;

abstract class _AppController with Store {
  @observable
  User _user = User.empty();

  @action
  void setUser(User user) {
    this._user = user;
  }

  User getUser() {
    return this._user;
  }
}
