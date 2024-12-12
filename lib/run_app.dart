import 'package:shared_preferences/shared_preferences.dart';

import 'core/routes/routes.dart';
import 'core/services/services_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class RunApp {
  static Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? userToken = prefs.getString('user');

    return runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();

      await ServicesManager.init();
      await afterAppRun();

      return runApp(ApplicationContent(isLoggedIn: userToken != null));
    }, (error, stack) async {
      debugPrint('Error initing app $error, the stack was: $stack');
    });
  }

  static Completer<void> afterRunAppCompleted = Completer();
  static Future<void> afterAppRun() async {
    if (!afterRunAppCompleted.isCompleted) {
      afterRunAppCompleted.complete();
    }
  }
}

class ApplicationContent extends StatelessWidget {
  final bool isLoggedIn;
  const ApplicationContent({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BuscaPreco',
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn ? Routes.home : Routes.index,
      getPages: Routes.routes,
    );
  }
}
