import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:busca_preco/core/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum CustomInputFormEnum { email, password }

class CustomInputForm extends StatelessWidget {
  final CustomInputFormEnum type;
  final LoginController _loginController = LoginController();
  final String text;

  CustomInputForm({super.key, required this.type, required this.text});

  @override
  Widget build(BuildContext context) {
    if (type == CustomInputFormEnum.email) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: TextField(
          controller: _loginController.emailController,
          decoration: InputDecoration(
            labelText: text,
            labelStyle: const TextStyle(
                color: Color.fromARGB(255, 85, 85, 85), fontSize: 15),
            prefixIcon: const Icon(Icons.person),
            prefixIconColor: Colors.grey,
            filled: true,
            fillColor: ColorsTheme.primary.withOpacity(0.2),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      );
    } else if (type == CustomInputFormEnum.password) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Obx(() => TextField(
              controller: _loginController.senhaController,
              obscureText: !_loginController.showPassword.value,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: const TextStyle(
                    color: Color.fromARGB(255, 85, 85, 85), fontSize: 15),
                prefixIcon: const Icon(Icons.lock),
                prefixIconColor: Colors.grey,
                filled: true,
                fillColor: ColorsTheme.primary.withOpacity(0.2),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _loginController.showPassword.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: const Color.fromARGB(255, 134, 132, 132),
                  ),
                  onPressed: _loginController.showPasswordToggle,
                ),
              ),
            )),
      );
    }

    return const SizedBox.shrink();
  }
}
