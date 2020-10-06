// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuestionsController on _QuestionsController, Store {
  final _$listQuestionsAtom = Atom(name: '_QuestionsController.listQuestions');

  @override
  List<Question> get listQuestions {
    _$listQuestionsAtom.reportRead();
    return super.listQuestions;
  }

  @override
  set listQuestions(List<Question> value) {
    _$listQuestionsAtom.reportWrite(value, super.listQuestions, () {
      super.listQuestions = value;
    });
  }

  final _$loadingSearchQuestionsAtom =
      Atom(name: '_QuestionsController.loadingSearchQuestions');

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

  @override
  String toString() {
    return '''
listQuestions: ${listQuestions},
loadingSearchQuestions: ${loadingSearchQuestions}
    ''';
  }
}
