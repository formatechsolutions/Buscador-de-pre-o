import 'package:busca_preco/core/pages/custom/appBar/simpleAppBar/simple_app_bar.dart';
import 'package:busca_preco/core/pages/custom/button/custom_button.dart';
import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:busca_preco/core/pages/custom/fields/custom_form_textfield.dart';
import 'package:busca_preco/core/pages/custom/text/custom_subtitle_primary.dart';
import 'package:busca_preco/core/pages/custom/text/custom_title_primary.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SimpleAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTitlePrimary(text: 'Realizar Login'),
                    const CustomSubtitlePrimary(
                      text:
                          'Digite as suas informações pessoais\npara ter acesso ao BuscaPreço.',
                    ),
                    const SizedBox(height: 20),
                    CustomFormTextfield(
                      text: 'Nome ou Email',
                      icon: Icons.perm_identity_sharp,
                    ),
                    const SizedBox(height: 20),
                    CustomFormTextfield(
                      text: 'Senha',
                      icon: Icons.lock,
                      isPassword: true,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              onPressed: () {

              },
              text: 'Entrar',
              colorButton: ColorsTheme.primary,
              colorBackground: true,
              buttonEnum: CustomButtonEnum.secondary,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}