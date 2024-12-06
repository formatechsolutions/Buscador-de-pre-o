import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    Future.delayed(Duration.zero, () {
      Get.snackbar(
        type == CustomNotificationEnum.error ? "Erro" : "Sucesso",
        message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: type == CustomNotificationEnum.error ? Colors.red : Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(10),
        borderRadius: 8, 
        snackStyle: SnackStyle.GROUNDED,
      );
    });

    return SizedBox.shrink();
  }
}
