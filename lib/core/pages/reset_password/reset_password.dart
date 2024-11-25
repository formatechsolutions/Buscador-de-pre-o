import 'package:busca_preco/core/pages/custom/appBar/simpleAppBar/simple_app_bar.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SimpleAppBar(),
      body: Center(
        child: Text('ResetPassword'),
      ),
    );
  }
}