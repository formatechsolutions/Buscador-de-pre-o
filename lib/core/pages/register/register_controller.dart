import 'package:busca_preco/core/backend/backend_connection.dart';
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
    debugPrint(etapa.toString());
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
        debugPrint('numberCodeController:');
        debugPrint(numberCodeController.text);
        if (numberCodeController.text == codeRegister.toString()) {
          Get.snackbar(
            "Sucesso",
            'Conta registrada com sucesso!',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: const Duration(seconds: 3),
            margin: const EdgeInsets.all(10),
            borderRadius: 8,
            snackStyle: SnackStyle.GROUNDED,
          );
          return true;
        } else {
          Get.snackbar(
            "Erro",
            'Código inválido!',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: const Duration(seconds: 3),
            margin: const EdgeInsets.all(10),
            borderRadius: 8,
            snackStyle: SnackStyle.GROUNDED,
          );

          return false;
        }
      } else {
        Get.snackbar(
          "Erro",
          'Ocorreu um erro!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(10),
          borderRadius: 8,
          snackStyle: SnackStyle.GROUNDED,
        );

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

        Get.snackbar(
          "Sucesso",
          'Código enviado com sucesso!',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(10),
          borderRadius: 8,
          snackStyle: SnackStyle.GROUNDED,
        );
      } else {
        Get.snackbar(
          "Erro",
          'Falha ao gerar código.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(10),
          borderRadius: 8,
          snackStyle: SnackStyle.GROUNDED,
        );
      }
    }
  }
}
