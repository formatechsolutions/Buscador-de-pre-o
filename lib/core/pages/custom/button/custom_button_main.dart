import 'package:busca_preco/core/pages/custom/app_style_configuration.dart';
import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonMain extends StatelessWidget {
  final String text;
  final String toPage;
  final Color colorButton;
  final bool colorBackground;

  const CustomButtonMain({
    super.key,
    required this.text,
    required this.toPage,
    required this.colorButton, 
    required this.colorBackground,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: OutlinedButton(
        onPressed: () {
          Get.toNamed(toPage);
        },
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(25.0),
          shape: RoundedRectangleBorder(
            borderRadius: AppStyleConfiguration.borderRadiusButton,
          ),
          side: BorderSide(
            color: colorButton,
            width: 2.0,
          ),
          backgroundColor: colorBackground ? colorButton : Colors.transparent,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: colorBackground ? ColorsController.textWhite : colorButton,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
