import 'package:flutter/material.dart';

class CustomTextTransparent extends StatelessWidget {
  final String text;
  final Color color;

  const CustomTextTransparent({super.key, 
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
      ),
    );
  }
}
