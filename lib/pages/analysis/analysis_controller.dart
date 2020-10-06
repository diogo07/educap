import 'package:educap/models/university.dart';
import 'package:educap/repository/dio/dio_service.dart';
import 'package:educap/repository/university_repository.dart';
import 'package:educap/helpers/constants.dart';
import 'package:flutter_modular/flutter_modular.dart';
import "package:mobx/mobx.dart";
part "analysis_controller.g.dart";

class AnalysisController = _AnalysisController with _$AnalysisController;

abstract class _AnalysisController with Store {
  UniversityRepository universityRepository =
      UniversityRepository(Modular.get<DioService>());

  @observable
  List<University> listUniversities = List<University>();

  @observable
  String filterUniversity;

  @observable
  bool loadingSearchUniversity = false;

  void showPage(String route) {
    Modular.to.pushReplacementNamed(route);
  }

  void routeToUniversity(String route, University university) {
    Constants.university = university;
    this.showPage(route);
  }

  void routeToQuestions(String route, int year) {
    Constants.yearAnalyze = year;
    this.showPage(route);
  }

  @action
  setFilterUniversity(String value) {
    this.filterUniversity = value;
    if (value.trim().length >= 3 && !this.loadingSearchUniversity) {
      this.searchUniversity();
    }

    if (value.trim().length < 3 && this.loadingSearchUniversity) {
      this.setLoadingSearchUniversity(false);
    }
  }

  @action
  setLoadingSearchUniversity(bool value) {
    this.loadingSearchUniversity = value;
  }

  @action
  setListUniversities(List<University> list) {
    this.listUniversities = list;
  }

  searchUniversity() async {
    this.setLoadingSearchUniversity(true);
    this.listUniversities =
        await universityRepository.filter(this.filterUniversity);
    this.setLoadingSearchUniversity(false);
  }
}
