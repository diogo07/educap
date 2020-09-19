import 'package:flutter_modular/flutter_modular.dart';
import "package:mobx/mobx.dart";
part "analysis_controller.g.dart";

class AnalysisController = _AnalysisController with _$AnalysisController;

abstract class _AnalysisController with Store {
  void showPage(String route) {
    Modular.to.pushReplacementNamed(route);
  }
}
