// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:busca_preco/core/pages/custom/button/custom_button_main.dart';
import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:busca_preco/core/pages/custom/text/version_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Obx(
        () => Container(
          color: ColorController().backgroundColor.value,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Image(
                image: AssetImage('assets/images/rectangle.png'),
                repeat: ImageRepeat.noRepeat,
                filterQuality: FilterQuality.high,
                alignment: Alignment.topCenter,
              ),
              const Spacer(),
              Transform.translate(
                offset: const Offset(0, -10),
                child: Text(
                  "BuscaPreço",
                  style: TextStyle(
                    fontSize: screenWidth * 0.12,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w900,
                    color: ColorsController.primary,
                  ),
                ),
              ),
              const Spacer(),
              const SizedBox(
                width: 300,
                child: CustomButtonMain(text: 'REGISTRAR', toPage: '/register', colorButton: ColorsController.primary, colorBackground: false)
              ),
              const SizedBox(height: 20.0),
              const SizedBox(
                width: 300,
                child: CustomButtonMain(text: 'LOGIN', toPage: '/login', colorButton: ColorsController.primary, colorBackground: true)
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
