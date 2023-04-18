// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xff6A5AE0, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff6A5AE0), //10%
      100: const Color(0xff6A5AE0), //20%
      200: const Color(0xff6A5AE0), //30%
      300: const Color(0xff6A5AE0), //40%
      400: const Color(0xff6A5AE0), //50%
      500: const Color(0xff6A5AE0), //60%
      600: const Color(0xff6A5AE0), //70%
      700: const Color(0xff6A5AE0), //80%
      800: const Color(0xff6A5AE0), //90%
      900: const Color(0xff6A5AE0), //100%
    },
  );
}
