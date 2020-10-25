import 'package:educap/helpers/data_chart_helper.dart';
import 'package:educap/models/course.dart';
import 'package:educap/models/custom_answer.dart';
import 'package:educap/models/enade.dart';
import 'package:educap/repository/answer_repository.dart';
import 'package:educap/repository/dio/dio_service.dart';
import 'package:educap/repository/enade_repository.dart';
import 'package:educap/repository/university_repository.dart';
import 'package:educap/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_modular/flutter_modular.dart';
import "package:mobx/mobx.dart";
part 'analyze_enade_controller.g.dart';

class AnalyzeEnadeController = _AnalyzeEnadeController
    with _$AnalyzeEnadeController;

abstract class _AnalyzeEnadeController with Store {
  EnadeRepository enadeRepository = EnadeRepository(Modular.get<DioService>());
  UniversityRepository universityRepository =
      UniversityRepository(Modular.get<DioService>());

  AnswerRepository answerRepository =
      AnswerRepository(Modular.get<DioService>());
  Course courseSelected = Course.lazy(0, "0", 0, 0);

  List<charts.Series> seriesList;

  @observable
  List<Enade> listEnades = List<Enade>();

  @observable
  List<Course> listCourses = List<Course>();

  @observable
  List<CustomAnswer> listCustomAnswers = List<CustomAnswer>();

  @observable
  bool loadingDataEnade = true;

  @observable
  bool loadingCourses = true;

  @observable
  bool loadingCustomAnswers = true;

  void showPage(String route) {
    Modular.to.pushReplacementNamed(route);
  }

  @action
  searchDataEnadeFromUniversity() async {
    this.loadingDataEnade = true;
    try {
      this.listEnades =
          await enadeRepository.filterByUniversity(Constants.university);
      await answerRepository.listByGroupPerceptionOfProof();
      this.loadingDataEnade = false;
    } on Exception catch (error) {}
  }

  @action
  searchCustomAnswers() async {
    this.loadingCustomAnswers = true;
    try {
      this.listCustomAnswers =
          await answerRepository.listByGroupPerceptionOfProof();
      this.seriesList =
          DataLineChartFormat(this.listCustomAnswers).createSeries();
      this.loadingCustomAnswers = false;
    } on Exception catch (error) {}
  }

  @action
  setCourseSelected(Course course) async {
    this.courseSelected = course;
    if (course.group == 0) {
      this.searchDataEnadeFromUniversity();
    } else {
      this.loadingDataEnade = true;
      try {
        this.listEnades = await enadeRepository.filterByUniversityAndCourse(
            Constants.university, course);
        this.loadingDataEnade = false;
      } on Exception catch (error) {}
    }
  }

  @action
  searchCoursesFromUniversity() async {
    this.loadingCourses = true;
    try {
      this.listCourses = await universityRepository
          .getCoursesOfUniversity(Constants.university.id);
      this.listCourses.insert(0, Course.lazy(0, "", 0, 0));
      this.courseSelected = listCourses[0];
      this.loadingCourses = false;
    } on Exception catch (error) {}
  }

  List<DropdownMenuItem<Course>> getItensDropdownMenu() {
    List<DropdownMenuItem<Course>> list = List<DropdownMenuItem<Course>>();
    this.listCourses.forEach((course) {
      list.add(DropdownMenuItem<Course>(
        value: course,
        child: Text(Constants.getCourseByGroup(course.group)),
      ));
    });
    return list;
  }
}
