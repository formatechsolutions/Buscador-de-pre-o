import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rx<bool> showPassword = false.obs;

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  void showPasswordToggle() {
    showPassword.value = !showPassword.value;
  }

  void login() {
    if (formKey.currentState!.validate()) {
      print('Email: ${emailController.text}');
      print('Senha: ${senhaController.text}');
    }
  }
}
