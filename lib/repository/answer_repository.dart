import 'package:educap/helpers/constants.dart';
import 'package:educap/models/answer.dart';
import 'package:educap/models/question.dart';
import 'package:educap/repository/dio/dio_service.dart';

class AnswerRepository {
  final DioService _dio;

  AnswerRepository(this._dio);

  Future<List<Question>> all() async {
    var response = await _dio.service.get("questao/list");
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      return Question.toList(response.data);
    }
  }

  Future<List<Answer>> findByQuestion(Question question) async {
    var response = await _dio.service.get(
        "resposta/universidade/${Constants.university.id}/ano/${Constants.yearAnalyze}/questao/${question.id}");
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      print(response.data);
      return Answer.toList(response.data);
    }
  }
}
