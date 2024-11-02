import 'package:busca_preco/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BuscaPreco',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      defaultTransition: Transition.fadeIn,
      getPages: Routes.routes,
    );
  }
}