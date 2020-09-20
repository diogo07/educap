// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnalysisController on _AnalysisController, Store {
  final _$listUniversitiesAtom =
      Atom(name: '_AnalysisController.listUniversities');

  @override
  List<University> get listUniversities {
    _$listUniversitiesAtom.reportRead();
    return super.listUniversities;
  }

  @override
  set listUniversities(List<University> value) {
    _$listUniversitiesAtom.reportWrite(value, super.listUniversities, () {
      super.listUniversities = value;
    });
  }

  final _$filterUniversityAtom =
      Atom(name: '_AnalysisController.filterUniversity');

  @override
  String get filterUniversity {
    _$filterUniversityAtom.reportRead();
    return super.filterUniversity;
  }

  @override
  set filterUniversity(String value) {
    _$filterUniversityAtom.reportWrite(value, super.filterUniversity, () {
      super.filterUniversity = value;
    });
  }

  final _$loadingSearchUniversityAtom =
      Atom(name: '_AnalysisController.loadingSearchUniversity');

  @override
  bool get loadingSearchUniversity {
    _$loadingSearchUniversityAtom.reportRead();
    return super.loadingSearchUniversity;
  }

  @override
  set loadingSearchUniversity(bool value) {
    _$loadingSearchUniversityAtom
        .reportWrite(value, super.loadingSearchUniversity, () {
      super.loadingSearchUniversity = value;
    });
  }

  final _$_AnalysisControllerActionController =
      ActionController(name: '_AnalysisController');

  @override
  dynamic setFilterUniversity(String value) {
    final _$actionInfo = _$_AnalysisControllerActionController.startAction(
        name: '_AnalysisController.setFilterUniversity');
    try {
      return super.setFilterUniversity(value);
    } finally {
      _$_AnalysisControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoadingSearchUniversity(bool value) {
    final _$actionInfo = _$_AnalysisControllerActionController.startAction(
        name: '_AnalysisController.setLoadingSearchUniversity');
    try {
      return super.setLoadingSearchUniversity(value);
    } finally {
      _$_AnalysisControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setListUniversities(List<University> list) {
    final _$actionInfo = _$_AnalysisControllerActionController.startAction(
        name: '_AnalysisController.setListUniversities');
    try {
      return super.setListUniversities(list);
    } finally {
      _$_AnalysisControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listUniversities: ${listUniversities},
filterUniversity: ${filterUniversity},
loadingSearchUniversity: ${loadingSearchUniversity}
    ''';
  }
}
