import 'package:dio/dio.dart';
import 'package:educap/helpers/constants.dart';
import 'dio_interceptors.dart';

class DioService {
  Dio service;

  DioService() {
    this.service = Dio();
    this.service.options.baseUrl = Constants.API_URL;
    this.service.options.extra["refresh"] = true;
    this.service.interceptors.add(DioInterceptors());
  }
}
