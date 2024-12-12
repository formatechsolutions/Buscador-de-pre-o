import 'package:get/get.dart';

class AddProductController extends GetxController {
  final barCode = ''.obs;

  void setBarCode(String value) => barCode.value = value;
}
