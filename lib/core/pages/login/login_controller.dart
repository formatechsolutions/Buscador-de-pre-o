import 'package:busca_preco/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool validateFields() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  Future<void> login(BuildContext context) async {
    if (validateFields()) {
      print(
          "Email: ${emailController.text}, Senha: ${passwordController.text}");
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

  void goToResetPasswordPage(BuildContext context) {
    Get.toNamed(Routes.resetPassword);
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
