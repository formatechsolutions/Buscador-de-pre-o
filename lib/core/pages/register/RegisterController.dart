import 'package:flutter/material.dart';

class Registercontroller {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  void register() {
    if (formKey.currentState!.validate()) {
      print('Nome: ${nomeController.text}');
      print('Email: ${emailController.text}');
      print('Senha: ${senhaController.text}');
    }
  }
}
