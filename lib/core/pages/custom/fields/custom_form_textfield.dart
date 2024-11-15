import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:busca_preco/core/pages/custom/fields/password_visibility_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFormTextfield extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool? isPassword;
  final PasswordVisibilityController _controller = Get.put(PasswordVisibilityController());

  CustomFormTextfield({
    super.key,
    required this.text,
    this.icon,
    this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextField(
          obscureText: isPassword != null ? _controller.isObscured.value : false,
          decoration: InputDecoration(
            hintText: text,
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsTheme.primary,
                width: 2.0,
              ),
            ),
            prefixIcon: icon != null ? Icon(icon) : null,
            suffixIcon: isPassword != null && isPassword!
                ? IconButton(
                    icon: Icon(
                      _controller.isObscured.value ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _controller.toggleVisibility,
                  )
                : null,
          ),
        ));
  }
}
