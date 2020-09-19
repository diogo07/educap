import 'package:dio/dio.dart';
import 'package:educap/models/user.dart';
import 'package:educap/utils/constants.dart';

class UserRepository {
  // final DioService _dio;
  final Dio _dio = Dio();

  Future<User> login(String username, String password) async {
    var response = await _dio.post('${Constants.API_URL}login',
        data: {'username': username, 'password': password});
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      Constants.USER_TOKEN = response.data['token'];
      return User.fromMap(response.data);
    }
  }
}
