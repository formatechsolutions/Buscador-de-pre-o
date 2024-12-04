import 'package:flutter/material.dart';

class CustomNotificationError extends StatelessWidget {
  final String message;
  final String title;

  const CustomNotificationError({super.key, required this.message, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      },
      child: const SizedBox(),
    );
  }
}
