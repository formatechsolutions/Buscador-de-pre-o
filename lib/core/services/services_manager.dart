import 'dart:async';

import 'package:busca_preco/core/backend/local_storage.dart';
import 'package:busca_preco/core/pages/custom/fields/password_visibility_controller.dart';
import 'package:busca_preco/core/pages/reset_password/reset_password_controller.dart';
import 'package:get/get.dart';

class ServicesManager {
  static final servicesInitialized = Completer<void>();

  static Future<void> init() async {
    Get.put(LocalStorage());
    Get.put(ResetPasswordController());
    Get.put(PasswordVisibilityController());
    
    if (!servicesInitialized.isCompleted) {
      servicesInitialized.complete();
    }
  }
}
