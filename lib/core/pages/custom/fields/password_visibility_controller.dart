import 'package:get/get.dart';

class PasswordVisibilityController extends GetxController {
  // Use RxBool para permitir reatividade com Obx.
  RxBool isObscured = true.obs;

  void toggleVisibility() {
    isObscured.value = !isObscured.value;
  }
}
