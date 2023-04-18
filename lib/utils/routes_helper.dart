// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:quiz_app/screens/onboarding.dart';
import 'package:quiz_app/screens/splash_screen.dart';

class RouteHelpper {
  static const String initial = '/';
  static const String onBoard = '/onBoard';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => SplashScreen()),
    GetPage(name: onBoard, page: () => OnBoarding()),
  ];
}
