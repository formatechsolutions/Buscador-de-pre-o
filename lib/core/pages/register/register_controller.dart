import 'package:busca_preco/core/pages/custom/notification/custom_notification_error.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPageController extends GetxController {
  var registerPageEtapa = 0.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dddController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  bool validateFields(int etapa) {
    if (etapa == 1) {
      return nameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          dddController.text.isNotEmpty &&
          phoneController.text.isNotEmpty;
    } else if (etapa == 2) {
      return cpfController.text.isNotEmpty &&
          cepController.text.isNotEmpty &&
          addressController.text.isNotEmpty;
    } else {
      return false;
    }
  }

  void goToRegisterPageEtapa(int etapa, BuildContext context) {
    if (!EmailValidator.validate(emailController.text)) {
      Get.dialog(
        CustomNotificationError(
          title: "Erro",
          message: "Por favor, insira um e-mail válido.",
        ),
      );
    } else {
      if (validateFields(etapa)) {
        registerPageEtapa.value = etapa;
      } else {
        Get.dialog(
          CustomNotificationError(
            title: "Erro",
            message: "Por favor, preencha todos os campos.",
          ),
        );
      }
    }
  }
}
