import 'package:dio/dio.dart';
import 'package:educap/models/user.dart';
import 'package:educap/utils/constants.dart';

class UserRepository {
  final Dio _dio = Dio();

  Future<User> login(String username, String password) async {
    var response = await _dio.post('${Constants.API_URL}login',
        data: {'username': username, 'password': password});
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      Constants.USER_TOKEN = response.data['token'];
      return User.fromMapAuthenticate(response.data);
    }
  }

  Future<bool> loginAvailable(String username) async {
    var response = await _dio
        .get('${Constants.API_URL}usuario/login_available/${username}');
    if (response.statusCode != 200) {
      throw Exception();
    } else {
      return response.data.length > 0 ? false : true;
    }
  }

  Future<User> save(User user) async {
    var response = await _dio.post("${Constants.API_URL}usuario/create",
        data: user.toJson());
    if (response.statusCode != 201) {
      throw Exception();
    } else {
      return User.fromMap(response.data);
    }
  }
}
