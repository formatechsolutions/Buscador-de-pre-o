import 'package:busca_preco/core/pages/custom/app_style_configuration.dart';
import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:flutter/material.dart';

enum CustomButtonEnum {
  primary,
  secondary,
}

class CustomButton extends StatelessWidget {
  final CustomButtonEnum buttonEnum;
  final VoidCallback? onPressed;
  final bool colorBackground;
  final Color colorButton;
  final String text;

  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.colorButton,
    required this.colorBackground,
    this.buttonEnum = CustomButtonEnum.primary,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (buttonEnum == CustomButtonEnum.primary ? 0.6 : 0.8),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(
            buttonEnum == CustomButtonEnum.primary ? 25.0 : 15.0,
          ),
          side: BorderSide(
            color: colorButton,
            width: 2.0,
          ),
          backgroundColor: colorBackground ? colorButton : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppStyleConfiguration.borderRadiusButton),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: colorBackground ? ColorsTheme.textWhite : colorButton,
            fontSize: buttonEnum == CustomButtonEnum.primary ? 14.0 : 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
