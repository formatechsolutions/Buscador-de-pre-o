import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum CustomNotificationEnum {
  error,
  success,
}

void showCustomNotification({
  required CustomNotificationEnum type,
  required String message,
}) {
  Get.snackbar(
    type == CustomNotificationEnum.error ? "Erro" : "Sucesso",
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: type == CustomNotificationEnum.error ? Colors.red : Colors.green,
    colorText: Colors.white,
    duration: const Duration(seconds: 2),
    margin: const EdgeInsets.all(10),
    borderRadius: 8,
  );
}