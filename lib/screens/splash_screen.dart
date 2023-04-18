// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/screens/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splash();
  }

  splash() async {
    await Future.delayed(const Duration(seconds: 3))
        .then((value) => Get.offAll(OnBoarding()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: Get.height,
      width: Get.width,
      color: Color(0xff6A5AE0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset("assets/animations/ani1.json", height: 180),
          Text(
            "Queezy",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),
          ),
        ],
      ),
    ));
  }
}
