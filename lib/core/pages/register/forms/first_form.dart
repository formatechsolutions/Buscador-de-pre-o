// ignore_for_file: unrelated_type_equality_checks

import 'package:busca_preco/core/pages/custom/appBar/simpleAppBar/simple_app_bar.dart';
import 'package:busca_preco/core/pages/custom/button/custom_button.dart';
import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:busca_preco/core/pages/custom/fields/custom_form_textfield.dart';
import 'package:busca_preco/core/pages/custom/notification/custom_notification.dart';
import 'package:busca_preco/core/pages/custom/statusbar/custom_statusbar.dart';
import 'package:busca_preco/core/pages/custom/text/custom_subtitle_primary.dart';
import 'package:busca_preco/core/pages/custom/text/custom_title_primary.dart';
import 'package:email_validator/email_validator.dart';
import 'package:busca_preco/core/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstForm extends StatelessWidget {
  FirstForm({super.key});

  final RegisterPageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomStatusbar(nivel: 15),
        SimpleAppBar(
          customOnpressed: () {
            if (controller.registerPageEtapa == 1) {
              Get.back();
            } else {
              controller.registerPageEtapa--;
            }
          },
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTitlePrimary(text: 'Crie uma conta'),
                  const CustomSubtitlePrimary(
                    text:
                        'Adicione suas informações para\ncompletar o seu registro.',
                  ),
                  const SizedBox(height: 20),
                  CustomFormTextfield(
                    text: 'Nome Completo',
                    icon: Icons.person,
                    controller: controller.nameController,
                  ),
                  const SizedBox(height: 20),
                  CustomFormTextfield(
                    text: 'Email',
                    icon: Icons.email,
                    controller: controller.emailController,
                  ),
                  const SizedBox(height: 20),
                  CustomFormTextfield(
                    text: 'Senha',
                    icon: Icons.lock,
                    isPassword: true,
                    controller: controller.passwordController,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      CustomFormTextfield(
                        text: 'DDD',
                        width: 100,
                        centerText: true,
                        type: CustomFormTextfieldEnum.number,
                        controller: controller.dddController,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomFormTextfield(
                          text: 'Telefone',
                          icon: Icons.phone,
                          type: CustomFormTextfieldEnum.number,
                          controller: controller.phoneController,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(
            onPressed: () {
              if (!EmailValidator.validate(controller.emailController.text)) {
                showCustomNotification(
                  type: CustomNotificationEnum.error,
                  message: "Por favor, insira um e-mail válido.",
                );
                return;
              } else if (!controller
                  .validateFields(controller.registerPageEtapa.value)) {
                showCustomNotification(
                  type: CustomNotificationEnum.error,
                  message: "Por favor, preencha todos os campos.",
                );
                return;
              } else {
                controller.goToNextRegisterPageEtapa();
              }
            },
            text: 'Avançar',
            colorButton: ColorsTheme.primary,
            colorBackground: true,
            buttonEnum: CustomButtonEnum.secondary,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
