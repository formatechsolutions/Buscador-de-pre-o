import 'package:busca_preco/core/pages/custom/appBar/simpleAppBar/simple_app_bar.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SimpleAppBar(),
      body: Center(
        child: Text('Login Page'),
      ),
    );
  }
}