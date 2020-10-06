// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnswerController on _AnswerController, Store {
  final _$listAnswersAtom = Atom(name: '_AnswerController.listAnswers');

  @override
  List<Answer> get listAnswers {
    _$listAnswersAtom.reportRead();
    return super.listAnswers;
  }

  @override
  set listAnswers(List<Answer> value) {
    _$listAnswersAtom.reportWrite(value, super.listAnswers, () {
      super.listAnswers = value;
    });
  }

  final _$loadingSearchAnswersAtom =
      Atom(name: '_AnswerController.loadingSearchAnswers');

  @override
  bool get loadingSearchAnswers {
    _$loadingSearchAnswersAtom.reportRead();
    return super.loadingSearchAnswers;
  }

  @override
  set loadingSearchAnswers(bool value) {
    _$loadingSearchAnswersAtom.reportWrite(value, super.loadingSearchAnswers,
        () {
      super.loadingSearchAnswers = value;
    });
  }

  @override
  String toString() {
    return '''
listAnswers: ${listAnswers},
loadingSearchAnswers: ${loadingSearchAnswers}
    ''';
  }
}
