import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddProductController extends GetxController {
  final barCode = ''.obs;
  final isNameValid = false.obs;

  final TextEditingController nameController = TextEditingController();

  void setBarCode(String value) {
    barCode.value = value;
  }

  void updateNameIcon() {
    isNameValid.value = nameController.text.isNotEmpty;
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
