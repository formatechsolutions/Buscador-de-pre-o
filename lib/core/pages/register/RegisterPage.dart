// ignore_for_file: use_key_in_widget_constructors

import 'package:busca_preco/core/src/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  final ColorController colorController = Get.put(ColorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Container(
            color: colorController.backgroundColor.value,
            child: const Column(
              children: [
                Center(
                  child: Text("Para ter acesso ao BuscaPreço você",
                      style: TextStyle(color: ColorsConfig.textBlack, fontSize: 20, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          )),
    );
  }
}
