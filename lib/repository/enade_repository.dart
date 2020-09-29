import 'package:educap/models/course.dart';
import 'package:educap/models/enade.dart';
import 'package:educap/models/university.dart';
import 'package:educap/repository/dio/dio_service.dart';

class EnadeRepository {
  final DioService _dio;

  EnadeRepository(this._dio);

  Future<List<Enade>> filterByUniversity(University university) async {
    var response =
        await _dio.service.get("aluno/universidade/${university.id}");
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      return Enade.toList(response.data);
    }
  }

  Future<List<Enade>> filterByUniversityAndCourse(
      University university, Course course) async {
    var response = await _dio.service
        .get("aluno/universidade/${university.id}/curso/${course.group}");
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      return Enade.toList(response.data);
    }
  }
}
