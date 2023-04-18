// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _checkIfOnBoardingCompleted();
  }

  Future<void> _checkIfOnBoardingCompleted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onBoardingCompleted = (prefs.getBool('onBoardingCompleted') ?? false);

    if (onBoardingCompleted) {
      Get.offAll(HomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoard(
        pageController: _pageController,

        onBoardData: onBoardData,
        titleStyles: const TextStyle(
          color: Color(0xff6A5AE0),
          fontSize: 18,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.15,
        ),
        descriptionStyles: TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 148, 141, 138),
        ),
        pageIndicatorStyle: const PageIndicatorStyle(
          width: 100,
          inactiveColor: Color.fromARGB(255, 177, 172, 231),
          activeColor: Color(0xff6A5AE0),
          inactiveSize: Size(8, 8),
          activeSize: Size(12, 12),
        ),
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        skipButton: TextButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('onBoardingCompleted', true);
            print('skipButton pressed');
            Get.offAll(HomeScreen());
          },
          child: const Text(
            "Skip",
            style: TextStyle(
              color: Color(0xff6A5AE0),
            ),
          ),
        ),
        // Either Provide onDone Callback or nextButton Widget to handle done state
        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            return InkWell(
              onTap: () => _onNextTap(state),
              child: Container(
                width: 230,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [
                      Colors.deepPurple,
                      Color(0xff6A5AE0),
                    ],
                  ),
                ),
                child: Text(
                  state.isLastPage ? "Done" : "Next",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _onNextTap(OnBoardState onBoardState) async {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('onBoardingCompleted', true);
      print("nextButton pressed");
      Get.offAll(HomeScreen());
    }
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "Set your own goals and get better",
    description: "Goal support your motivation and inspire you to work harder",
    imgUrl: 'assets/images/img1.png',
  ),
  const OnBoardModel(
    title: "Track your progress with statistics",
    description:
        "Analyse personal result with detailed chart and numerical values",
    imgUrl: 'assets/images/img2.png',
  ),
  const OnBoardModel(
    title: "Create photo comparision and share your results",
    description:
        "Take before and after photos to visualize progress and get the shape that you dream about",
    imgUrl: 'assets/images/img3.png',
  ),
];
