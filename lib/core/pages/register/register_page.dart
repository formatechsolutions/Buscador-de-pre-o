// ignore_for_file: unrelated_type_equality_checks

import 'package:busca_preco/core/pages/errors/404/error_404.dart';
import 'package:busca_preco/core/pages/register/forms/first_form.dart';
import 'package:busca_preco/core/pages/register/forms/second_form.dart';
import 'package:busca_preco/core/pages/register/register_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final RegisterPageController controller = Get.put(RegisterPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.registerPageEtapa == 0) {
          return Scaffold(
            body: FirstForm(),
          );
        } else if (controller.registerPageEtapa == 1) {
          return Scaffold(
            body: SecondForm(),
          );
        } else {
          controller.goToRegisterPageEtapa(0);
          return const Scaffold(body: Error404());
        }
      }),
    );
  }
}
