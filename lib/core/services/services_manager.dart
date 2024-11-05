import 'dart:async';

class ServicesManager {
  static final servicesInitialized = Completer<void>();

  static Future<void> init() async {

    if (!servicesInitialized.isCompleted) {
      servicesInitialized.complete();
    }
  }
}
