// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analyze_enade_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnalyzeEnadeController on _AnalyzeEnadeController, Store {
  final _$listEnadesAtom = Atom(name: '_AnalyzeEnadeController.listEnades');

  @override
  List<Enade> get listEnades {
    _$listEnadesAtom.reportRead();
    return super.listEnades;
  }

  @override
  set listEnades(List<Enade> value) {
    _$listEnadesAtom.reportWrite(value, super.listEnades, () {
      super.listEnades = value;
    });
  }

  final _$listCoursesAtom = Atom(name: '_AnalyzeEnadeController.listCourses');

  @override
  List<Course> get listCourses {
    _$listCoursesAtom.reportRead();
    return super.listCourses;
  }

  @override
  set listCourses(List<Course> value) {
    _$listCoursesAtom.reportWrite(value, super.listCourses, () {
      super.listCourses = value;
    });
  }

  final _$loadingDataEnadeAtom =
      Atom(name: '_AnalyzeEnadeController.loadingDataEnade');

  @override
  bool get loadingDataEnade {
    _$loadingDataEnadeAtom.reportRead();
    return super.loadingDataEnade;
  }

  @override
  set loadingDataEnade(bool value) {
    _$loadingDataEnadeAtom.reportWrite(value, super.loadingDataEnade, () {
      super.loadingDataEnade = value;
    });
  }

  final _$loadingCoursesAtom =
      Atom(name: '_AnalyzeEnadeController.loadingCourses');

  @override
  bool get loadingCourses {
    _$loadingCoursesAtom.reportRead();
    return super.loadingCourses;
  }

  @override
  set loadingCourses(bool value) {
    _$loadingCoursesAtom.reportWrite(value, super.loadingCourses, () {
      super.loadingCourses = value;
    });
  }

  final _$searchDataEnadeFromUniversityAsyncAction =
      AsyncAction('_AnalyzeEnadeController.searchDataEnadeFromUniversity');

  @override
  Future searchDataEnadeFromUniversity() {
    return _$searchDataEnadeFromUniversityAsyncAction
        .run(() => super.searchDataEnadeFromUniversity());
  }

  final _$setCourseSelectedAsyncAction =
      AsyncAction('_AnalyzeEnadeController.setCourseSelected');

  @override
  Future setCourseSelected(Course course) {
    return _$setCourseSelectedAsyncAction
        .run(() => super.setCourseSelected(course));
  }

  final _$searchCoursesFromUniversityAsyncAction =
      AsyncAction('_AnalyzeEnadeController.searchCoursesFromUniversity');

  @override
  Future searchCoursesFromUniversity() {
    return _$searchCoursesFromUniversityAsyncAction
        .run(() => super.searchCoursesFromUniversity());
  }

  @override
  String toString() {
    return '''
listEnades: ${listEnades},
listCourses: ${listCourses},
loadingDataEnade: ${loadingDataEnade},
loadingCourses: ${loadingCourses}
    ''';
  }
}
