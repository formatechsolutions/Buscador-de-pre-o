// ignore_for_file: use_key_in_widget_constructors

import 'package:busca_preco/core/pages/custom/button/custom_button_main.dart';
import 'package:busca_preco/core/pages/custom/colors.dart';
import 'package:busca_preco/core/pages/custom/text/version_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final ColorController colorController = Get.put(ColorController());

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Obx(
        () => Container(
          color: colorController.backgroundColor.value,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/rectangle.png'),
                repeat: ImageRepeat.noRepeat,
                filterQuality: FilterQuality.high,
                alignment: Alignment.topCenter,
              ),
              Column(
                children: [
                  Image(
                    image: const AssetImage('assets/icons/icon.png'),
                    height: screenHeight * 0.15,
                    filterQuality: FilterQuality.high,
                    alignment: Alignment.center,
                  ),
                  Transform.translate(
                    offset: const Offset(0, -10),
                    child: Text(
                      "BuscaPreço",
                      style: TextStyle(
                        fontSize: screenWidth * 0.09,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w900,
                        color: ColorsConfig.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: CustomButtonMain(text: 'REGISTRAR', toPage: '/register', colorButton: ColorsConfig.primary, colorBackground: false)
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(
                    width: 300,
                    child: CustomButtonMain(text: 'LOGIN', toPage: '/login', colorButton: ColorsConfig.primary, colorBackground: true)
                  )
                ],
              ),
              const Spacer(),
              const VersionApp(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
