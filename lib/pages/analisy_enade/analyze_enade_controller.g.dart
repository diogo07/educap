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

  final _$loadingSearchQuestionsAtom =
      Atom(name: '_AnalyzeEnadeController.loadingSearchQuestions');

  @override
  bool get loadingSearchQuestions {
    _$loadingSearchQuestionsAtom.reportRead();
    return super.loadingSearchQuestions;
  }

  @override
  set loadingSearchQuestions(bool value) {
    _$loadingSearchQuestionsAtom
        .reportWrite(value, super.loadingSearchQuestions, () {
      super.loadingSearchQuestions = value;
    });
  }

  final _$searchQuestionsAsyncAction =
      AsyncAction('_AnalyzeEnadeController.searchQuestions');

  @override
  Future searchQuestions() {
    return _$searchQuestionsAsyncAction.run(() => super.searchQuestions());
  }

  final _$_AnalyzeEnadeControllerActionController =
      ActionController(name: '_AnalyzeEnadeController');

  @override
  dynamic setListEnades(List<Enade> list) {
    final _$actionInfo = _$_AnalyzeEnadeControllerActionController.startAction(
        name: '_AnalyzeEnadeController.setListEnades');
    try {
      return super.setListEnades(list);
    } finally {
      _$_AnalyzeEnadeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listEnades: ${listEnades},
loadingSearchQuestions: ${loadingSearchQuestions}
    ''';
  }
}
