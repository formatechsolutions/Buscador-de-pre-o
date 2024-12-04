import 'package:flutter/material.dart';

enum CustomNotificationEnum {
  error,
  success,
}

class CustomNotification extends StatelessWidget {
  final CustomNotificationEnum type;
  final String message;

  const CustomNotification({
    super.key,
    required this.type,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(type == CustomNotificationEnum.error ? "Erro" : "Sucesso"),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("OK"),
        ),
      ],
    );
  }
}