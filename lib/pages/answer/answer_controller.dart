import 'package:educap/helpers/constants.dart';
import 'package:educap/models/answer.dart';
import 'package:educap/models/question.dart';
import 'package:educap/repository/answer_repository.dart';
import 'package:educap/repository/dio/dio_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import "package:mobx/mobx.dart";
part "answer_controller.g.dart";

class AnswerController = _AnswerController with _$AnswerController;

abstract class _AnswerController with Store {
  @observable
  List<Answer> listAnswers = List<Answer>();
  AnswerRepository answerRepository =
      AnswerRepository(Modular.get<DioService>());

  @observable
  bool loadingSearchAnswers = false;

  void showPage(String route) {
    Modular.to.pushReplacementNamed(route);
  }

  searchAnswer(Question question) async {
    this.loadingSearchAnswers = true;
    this.listAnswers = await this.answerRepository.findByQuestion(question);
    this.setColorsListAnswer(this.listAnswers);
    this.loadingSearchAnswers = false;
  }

  void setColorsListAnswer(List<Answer> list) {
    for (int i = 0; i < list.length; i++) {
      list[i].color = Constants.getColor(i);
    }
  }
}
