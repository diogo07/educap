import 'package:educap/pages/analysis/analysis_controller.dart';
import 'package:educap/pages/analysis/analysis_screen.dart';
import 'package:educap/pages/home/home_controller.dart';
import 'package:educap/pages/home/home_screen.dart';
import 'package:educap/pages/login/login_controller.dart';
import 'package:educap/pages/login/login_screen.dart';
import 'package:educap/pages/register/register_controller.dart';
import 'package:educap/pages/register/register_screen.dart';
import 'package:educap/pages/splash/splash_screen.dart';
import 'package:educap/pages/university_analyze/university_analyze_search_screen.dart';
import 'package:educap/repository/dio/dio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => LoginController()),
        Bind((i) => RegisterController()),
        Bind((i) => AnalysisController()),
        Bind((i) => DioService()),
      ];

  @override
  List<Router> get routers => [
        Router("/", child: (_, args) => SplashScreen()),
        Router("/login", child: (_, args) => LoginScreen()),
        Router("/register", child: (_, args) => RegisterScreen()),
        Router("/home", child: (_, args) => HomeScreen()),
        Router("/analysis", child: (_, args) => AnalysisScreen()),
        Router("/analysis/university",
            child: (_, args) => UniversityAnalyzeSearchScreen()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
