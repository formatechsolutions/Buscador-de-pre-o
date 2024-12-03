import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPageController extends GetxController {
  var registerPageEtapa = 0.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dddController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool validateFields() {
    return nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        dddController.text.isNotEmpty &&
        phoneController.text.isNotEmpty;
  }

  void goToRegisterPageEtapa(int etapa, BuildContext context) {
  if (validateFields()) {
    registerPageEtapa.value = etapa; 
  } else {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Erro"),
        content: const Text("Por favor, preencha todos os campos."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
}