// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:quiz_app/utils/routes_helper.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/screens/splash_screen.dart';
import 'package:quiz_app/utils/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Palette.kToDark, primaryColor: Color(0xff6A5AE0)),
        initialRoute: '/',
        getPages: RouteHelpper.routes);
  }
}
