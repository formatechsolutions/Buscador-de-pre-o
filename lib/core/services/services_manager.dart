import 'dart:async';

class ServicesManager {
  static final servicesInitialized = Completer<void>();

  static Future<void> init() async {
    // Get.put(ColorsController());
    
    if (!servicesInitialized.isCompleted) {
      servicesInitialized.complete();
    }
  }
}
