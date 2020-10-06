import 'package:educap/helpers/constants.dart';
import 'package:educap/models/question.dart';
import 'package:educap/repository/dio/dio_service.dart';
import 'package:educap/repository/questions_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import "package:mobx/mobx.dart";
part "questions_controller.g.dart";

class QuestionsController = _QuestionsController with _$QuestionsController;

abstract class _QuestionsController with Store {
  @observable
  List<Question> listQuestions = List<Question>();
  QuestionsRepository questionsRepository =
      QuestionsRepository(Modular.get<DioService>());

  @observable
  bool loadingSearchQuestions = false;

  void showPage(String route) {
    Modular.to.pushReplacementNamed(route);
  }

  searchQuestions() async {
    this.loadingSearchQuestions = true;
    this.listQuestions = await questionsRepository.all();
    this.loadingSearchQuestions = false;
  }

  searchDataAnswersByQuestion(Question question) async {}
}
