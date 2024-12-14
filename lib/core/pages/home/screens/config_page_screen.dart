import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:busca_preco/core/pages/home/screens/components/label_buttons.dart';
import 'package:busca_preco/core/pages/home/screens/controllers/config_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfigPageScreen extends StatelessWidget {
  ConfigPageScreen({super.key});

  final ConfigPageController _controller = Get.put(ConfigPageController());

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
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 34),
            Column(
              children: [
                LabelButtons(type: TypeButtonLabel.primary, title: 'Conta', prefixIcon: Icons.person, suffixIcon: Icons.arrow_forward_ios_rounded),
                const SizedBox(height: 20),
                LabelButtons(type: TypeButtonLabel.primary, title: 'Notificações', prefixIcon: Icons.notifications, suffixIcon: Icons.arrow_forward_ios_rounded),
                const SizedBox(height: 20),
                LabelButtons(type: TypeButtonLabel.logout, title: 'Sair', prefixIcon: Icons.logout, suffixIcon: Icons.arrow_forward_ios_rounded, onTap: () => _controller.logout()),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
