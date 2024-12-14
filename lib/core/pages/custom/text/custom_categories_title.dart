import 'package:flutter/material.dart';

class CustomCategoriesTitle extends StatelessWidget {
  final String title;

  const CustomCategoriesTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
