import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigPageController extends GetxController {
  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    await prefs.remove('user');

    Get.offAllNamed('/login');
  }
}
