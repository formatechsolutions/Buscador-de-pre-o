import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Center(
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          color: ColorsTheme.textBlack,
          onPressed: () => Get.back(),
        ),
      ),
    );
  }
}
