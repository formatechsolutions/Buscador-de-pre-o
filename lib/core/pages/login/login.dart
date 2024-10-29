// ignore_for_file: use_key_in_widget_constructors

import 'package:busca_preco/core/src/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final ColorController colorController = Get.put(ColorController());

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Obx(() => Container(
            color: colorController.backgroundColor.value,
            child: SizedBox(
              height: screenHeight * 0.3,
              width: double.infinity,
              child: const Image(
                image: AssetImage('assets/images/rectangle.png'),
                fit: BoxFit.cover,
                repeat: ImageRepeat.noRepeat,
                filterQuality: FilterQuality.high,
                alignment: Alignment.topCenter,
              ),
            ),
          )),
    );
  }
}
