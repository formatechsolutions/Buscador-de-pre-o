import 'package:busca_preco/core/pages/custom/appBar/simpleAppBar/simple_app_bar.dart';
import 'package:busca_preco/core/pages/custom/fields/custom_form_textfield.dart';
import 'package:busca_preco/core/pages/custom/statusbar/custom_statusbar.dart';
import 'package:busca_preco/core/pages/custom/text/custom_subtitle_primary.dart';
import 'package:busca_preco/core/pages/custom/text/custom_title_primary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            const CustomStatusbar(nivel: 10),
            SimpleAppBar(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                      text: 'Nome Completo', icon: Icons.person),
                  const SizedBox(height: 20),
                  CustomFormTextfield(text: 'Email', icon: Icons.email),
                  const SizedBox(height: 20),
                  CustomFormTextfield(
                    text: 'Senha',
                    icon: Icons.lock,
                    isPassword: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
