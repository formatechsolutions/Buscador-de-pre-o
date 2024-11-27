import 'package:busca_preco/core/pages/custom/appBar/simpleAppBar/simple_app_bar.dart';
import 'package:busca_preco/core/pages/custom/button/custom_button.dart';
import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:busca_preco/core/pages/custom/fields/custom_form_textfield.dart';
import 'package:busca_preco/core/pages/custom/text/custom_subtitle_primary.dart';
import 'package:busca_preco/core/pages/custom/text/custom_title_primary.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTitlePrimary(text: 'Redefinir senha'),
                    CustomSubtitlePrimary(
                      text:
                          'Caso tenha perdido o acesso da sua\nconta, digite o seu gmail atual para\nreceber o link de redefinição',
                    ),
                    const SizedBox(height: 20),
                    CustomFormTextfield(
                      text: 'Email',
                      icon: Icons.email,
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              onPressed: () => {},
              text: 'Redefinir',
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
