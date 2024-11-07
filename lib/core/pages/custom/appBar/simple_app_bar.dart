// ignore_for_file: use_key_in_widget_constructors

import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleAppBar {
  static AppBar build() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: ColorsTheme.primary,
        onPressed: () => Navigator.of(Get.context!).pop(),
      ),
    );
  }
}
