import 'package:busca_preco/core/pages/register/forms/first_form.dart';
import 'package:busca_preco/core/pages/register/forms/second_form.dart';
import 'package:busca_preco/core/pages/register/forms/third_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterPageController controller = Get.find<RegisterPageController>();
    final PageController pageController = PageController();

    controller.setPageController(pageController);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                FirstForm(),
                SecondForm(),
                ThirdForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}