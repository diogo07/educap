import 'package:educap/app/app_controller.dart';
import 'package:educap/pages/about/about_screen.dart';
import 'package:educap/pages/analisy_enade/analyze_enade_controller.dart';
import 'package:educap/pages/analisy_enade/analyze_enade_screen.dart';
import 'package:educap/pages/analysis/analysis_controller.dart';
import 'package:educap/pages/home/home_controller.dart';
import 'package:educap/pages/home/home_screen.dart';
import 'package:educap/pages/login/login_controller.dart';
import 'package:educap/pages/login/login_screen.dart';
import 'package:educap/pages/profile/profile_controller.dart';
import 'package:educap/pages/profile/profile_screen.dart';
import 'package:educap/pages/questions/questions_controller.dart';
import 'package:educap/pages/questions/questions_screen.dart';
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
        Bind((i) => AppController()),
        Bind((i) => HomeController()),
        Bind((i) => LoginController()),
        Bind((i) => RegisterController()),
        Bind((i) => ProfileController()),
        Bind((i) => AnalysisController()),
        Bind((i) => AnalyzeEnadeController()),
        Bind((i) => QuestionsController()),
        Bind((i) => DioService()),
      ];

  @override
  List<Router> get routers => [
        Router("/", child: (_, args) => SplashScreen()),
        Router("/login", child: (_, args) => LoginScreen()),
        Router("/register", child: (_, args) => RegisterScreen()),
        Router("/home", child: (_, args) => HomeScreen()),
        Router("/about", child: (_, args) => AboutScreen()),
        Router("/profile", child: (_, args) => ProfileScreen()),
        Router("/analysis",
            child: (_, args) => UniversityAnalyzeSearchScreen()),
        Router("/analysis/university",
            child: (_, args) => AnalyzeEnadeScreen()),
        Router("/analysis/university/questions",
            child: (_, args) => QuestionsEnadeScreen()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
