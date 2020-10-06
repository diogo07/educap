import 'package:educap/models/question.dart';
import 'package:educap/repository/dio/dio_service.dart';

class QuestionsRepository {
  final DioService _dio;

  QuestionsRepository(this._dio);

  Future<List<Question>> all() async {
    var response = await _dio.service.get("questao/list");
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      return Question.toList(response.data);
    }
  }
}
