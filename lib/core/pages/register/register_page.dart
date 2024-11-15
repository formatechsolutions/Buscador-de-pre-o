import 'package:busca_preco/core/pages/custom/appBar/simpleAppBar/simple_app_bar.dart';
import 'package:busca_preco/core/pages/custom/button/custom_button.dart';
import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:busca_preco/core/pages/custom/fields/custom_form_textfield.dart';
import 'package:busca_preco/core/pages/custom/statusbar/custom_statusbar.dart';
import 'package:busca_preco/core/pages/custom/text/custom_subtitle_primary.dart';
import 'package:busca_preco/core/pages/custom/text/custom_title_primary.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomStatusbar(nivel: 10),
          const SimpleAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                      text: 'Nome Completo',
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 20),
                    CustomFormTextfield(text: 'Email', icon: Icons.email),
                    const SizedBox(height: 20),
                    CustomFormTextfield(
                      text: 'Senha',
                      icon: Icons.lock,
                      isPassword: true,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        CustomFormTextfield(
                          text: 'DDD',
                          width: 100,
                          centerText: true,
                          type: CustomFormTextfieldEnum.number,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomFormTextfield(
                            text: 'Telefone',
                            icon: Icons.phone,
                            type: CustomFormTextfieldEnum.number,
                          ),
                        ),
                      ],
                    ),
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
              text: 'Registrar',
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
