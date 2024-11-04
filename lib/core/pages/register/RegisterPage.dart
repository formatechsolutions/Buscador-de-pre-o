// ignore_for_file: use_key_in_widget_constructors, file_names, use_super_parameters

import 'package:busca_preco/core/pages/custom/appBar/simple_app_bar.dart';
import 'package:busca_preco/core/pages/custom/colors.dart';
import 'package:busca_preco/core/pages/register/RegisterController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  final ColorController colorController = Get.put(ColorController());
  final Registercontroller _registerController = Registercontroller();

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(),
      body: Obx(() => Container(
          color: colorController.backgroundColor.value,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _registerController.formKey, 
              child: const Column(),
            )
          ))),
    );
  }
}
