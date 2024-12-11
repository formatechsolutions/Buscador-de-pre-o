import 'package:flutter/material.dart';

class AddPageScreen extends StatelessWidget {
  const AddPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar produto'),
      ),
      body: const Center(
        child: Text('Adicionar produtos'),
      ),
    );
  }
}