import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorController extends GetxController {
  Rx<Color> backgroundColor = ColorsTheme.backgroundWhite.obs;

  void setBackgroundColor(Color color) {
    backgroundColor.value = color;
  }
}

class ColorsTheme {
  static const Color primary = Color(0xFF304FFE);
  
  // White
  static const Color inputDefaultColor = Color(0xFFB8B8B8);
  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color backgroundApp = Color.fromARGB(255, 233, 230, 230);
  static const Color textWhite = Color(0xFFFFFFFF);

  // Black
  static const Color backgroundBlack = Color.fromARGB(255, 0, 0, 0);
  static const Color textBlack = Color(0xFF000000);

  // Grey
  static const Color transparentGrey = Color.fromARGB(255, 183, 183, 184);
  static const Color buttonGrey = Color.fromARGB(255, 183, 183, 184);
  static const Color textGrey = Color(0xFF2A2A2A);
}