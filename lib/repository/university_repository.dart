import 'package:educap/models/course.dart';
import 'package:educap/models/university.dart';
import 'package:educap/repository/dio/dio_service.dart';

class UniversityRepository {
  final DioService _dio;

  UniversityRepository(this._dio);

  Future<List<University>> filter(String filter) async {
    var response = await _dio.service.get("universidade/${filter}");
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      return University.toList(response.data);
    }
  }

  Future<List<Course>> getCoursesOfUniversity(int id) async {
    var response = await _dio.service.get("universidade/${id}/cursos");
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      return Course.toList(response.data);
    }
  }
}
