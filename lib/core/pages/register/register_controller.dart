import 'package:busca_preco/core/backend/backend_connection.dart';
import 'package:busca_preco/core/pages/custom/notification/custom_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPageController extends GetxController {
  var registerPageEtapa = 1.obs;
  PageController? _pageController;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dddController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController numberCodeController = TextEditingController();

  final BackendConnection _backendConnection = BackendConnection();

  late int codeRegister = 0;

  bool validateFields(int etapa) {
    if (etapa == 1) {
      var bool = nameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          dddController.text.isNotEmpty &&
          phoneController.text.isNotEmpty;
      return bool;
    } else if (etapa == 2) {
      var bool = cpfController.text.isNotEmpty &&
          cepController.text.isNotEmpty &&
          addressController.text.isNotEmpty;
      return bool;
    } else if (etapa == 3) {
      var bool = nameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          dddController.text.isNotEmpty &&
          phoneController.text.isNotEmpty &&
          cpfController.text.isNotEmpty &&
          cepController.text.isNotEmpty &&
          addressController.text.isNotEmpty &&
          numberCodeController.text.isNotEmpty;

      if (bool) {
        if (numberCodeController.text == codeRegister.toString()) {
          showCustomNotification(
              message: "Conta registrada com sucesso!",
              type: CustomNotificationEnum.success);

          return true;
        } else {
          showCustomNotification(
              message: "Código inválido!", type: CustomNotificationEnum.error);

          return false;
        }
      } else {
        showCustomNotification(
            message: "Ocorreu um erro!", type: CustomNotificationEnum.error);

        return false;
      }
    } else {
      return false;
    }
  }

  void setPageController(PageController pageController) {
    _pageController = pageController;

    ever<int>(registerPageEtapa, (etapa) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _pageController?.animateToPage(
          etapa - 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    });
  }

  void goToNextRegisterPageEtapa() async {
    registerPageEtapa++;

    if (registerPageEtapa.value == 3) {
      final codeResponse =
          await _backendConnection.generateTokenRegister(emailController.text);

      if (codeResponse != null) {
        codeRegister = codeResponse;

        showCustomNotification(
            message: "Código enviado com sucesso!",
            type: CustomNotificationEnum.success);
      } else {
        showCustomNotification(
            message: "Falha ao gerar código",
            type: CustomNotificationEnum.error);
      }
    }
  }
}
