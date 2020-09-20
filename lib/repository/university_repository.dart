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
}
