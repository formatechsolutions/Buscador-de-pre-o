import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:busca_preco/core/pages/custom/text/custom_categories_title.dart';
import 'package:flutter/material.dart';

class ConfigPageScreen extends StatelessWidget {
  const ConfigPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.backgroundApp,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configurações',
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 150,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: ColorsTheme.textGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://via.placeholder.com/80',
                        width: 80,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Supermercado Moreira',
                          style: TextStyle(
                            color: ColorsTheme.backgroundApp,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'O melhor lugar para suas compras!',
                          style: TextStyle(
                            color: ColorsTheme.backgroundApp,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomCategoriesTitle(title: 'Ajustes'),
            const SizedBox(height: 20),
            Container(
              height: 350,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: ColorsTheme.buttonGrey,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
