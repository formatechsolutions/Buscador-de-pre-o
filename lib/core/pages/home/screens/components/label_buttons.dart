import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:flutter/material.dart';

enum TypeButtonLabel { primary, secondary, logout }

class LabelButtons extends StatelessWidget {
  final TypeButtonLabel type;
  final String title;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final VoidCallback? onTap;

  const LabelButtons(
      {super.key,
      required this.type,
      required this.title,
      required this.prefixIcon,
      required this.suffixIcon,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        decoration: BoxDecoration(
          color: ColorsTheme.backgroundWhite.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(children: [
          Icon(
            type == TypeButtonLabel.primary
                ? prefixIcon
                : type == TypeButtonLabel.logout
                    ? Icons.logout
                    : prefixIcon,
            color: type == TypeButtonLabel.primary
                ? ColorsTheme.textBlack
                : type == TypeButtonLabel.logout
                    ? Colors.red
                    : ColorsTheme.textBlack,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              color: type == TypeButtonLabel.primary
                  ? ColorsTheme.textBlack
                  : type == TypeButtonLabel.logout
                      ? Colors.red
                      : ColorsTheme.textBlack,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Icon(
            suffixIcon,
            color: type == TypeButtonLabel.primary
                ? ColorsTheme.textBlack
                : type == TypeButtonLabel.logout
                    ? Colors.red
                    : ColorsTheme.textBlack,
          ),
        ]),
      ),
    );
  }
}
