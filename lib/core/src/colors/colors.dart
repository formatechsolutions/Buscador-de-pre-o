import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorController extends GetxController {
  Rx<Color> backgroundColor = ColorsConfig.backgroundWhite.obs;

  void setBackgroundColor(Color color) {
    backgroundColor.value = color;
  }
}

class ColorsConfig {
  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color backgroundBlack = Color.fromARGB(255, 0, 0, 0);
  static const Color primary = Color(0xFF353668);
  static const Color transparentGrey = Color.fromARGB(255, 159, 159, 160);
}
