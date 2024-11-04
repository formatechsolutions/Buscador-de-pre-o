import 'package:busca_preco/core/pages/custom/colors.dart';
import 'package:flutter/material.dart';

class CustomSecondaryButton extends StatelessWidget {
  final String text;
  final Color colorButton;
  final bool colorBackground;
  final VoidCallback onPressed;

  const CustomSecondaryButton({
    super.key,
    required this.text,
    required this.colorButton,
    required this.colorBackground,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
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
            color: colorBackground ? ColorsConfig.textWhite : colorButton,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
