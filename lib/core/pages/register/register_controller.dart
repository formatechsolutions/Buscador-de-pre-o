import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rx<bool> showPassword = false.obs;

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  void register() {
    if (formKey.currentState!.validate()) {
      
    }
  }

  void showPasswordToggle() {
    showPassword.value = !showPassword.value;
  }
}
