import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorController extends GetxController {
  Rx<Color> backgroundColor = ColorsController.backgroundWhite.obs;

  void setBackgroundColor(Color color) {
    backgroundColor.value = color;
  }
}

class ColorsController {
  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color backgroundBlack = Color.fromARGB(255, 0, 0, 0);
  static const Color primary = Color(0xFF353668);
  static const Color transparentGrey = Color.fromARGB(255, 159, 159, 160);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textBlack = Color(0xFF000000);
}
