import 'package:educap/models/enade.dart';
import 'package:educap/models/university.dart';
import 'package:educap/repository/dio/dio_service.dart';
import 'package:educap/repository/enade_repository.dart';
import 'package:educap/utils/constants.dart';
import 'package:flutter_modular/flutter_modular.dart';
import "package:mobx/mobx.dart";
part 'analyze_enade_controller.g.dart';

class AnalyzeEnadeController = _AnalyzeEnadeController
    with _$AnalyzeEnadeController;

abstract class _AnalyzeEnadeController with Store {
  EnadeRepository enadeRepository = EnadeRepository(Modular.get<DioService>());

  @observable
  List<Enade> listEnades = List<Enade>();

  @observable
  bool loadingSearchQuestions = true;

  void showPage(String route) {
    Modular.to.pushReplacementNamed(route);
  }

  @action
  searchQuestions() async {
    this.loadingSearchQuestions = true;
    try {
      this.listEnades =
          await enadeRepository.filterByUniversity(Constants.university);
    } on Exception catch (error) {}
  }

  @action
  setListEnades(List<Enade> list) {
    this.listEnades = list;
  }
}
