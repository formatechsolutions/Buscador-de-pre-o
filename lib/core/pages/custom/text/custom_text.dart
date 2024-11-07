import 'package:busca_preco/core/pages/custom/app_style_configuration.dart';
import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum CustomTextEnum { primary, transparent, versionApp, small }

class CustomText extends StatelessWidget {
  final CustomTextEnum type;
  final String? text;
  final Color? color;
  final TextStyle? style;

  const CustomText({
    super.key,
    required this.type,
    this.text,
    this.style,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (type == CustomTextEnum.primary) {
      return Text(
        text!,
        style: TextStyle(
          color: color,
        ),
      );
    } else if (type == CustomTextEnum.transparent) {
      return const SizedBox.shrink();
    } else if (type == CustomTextEnum.versionApp) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('');
              } else if (snapshot.hasError) {
                return const Text('');
              } else {
                final version = snapshot.data?.version ?? 'Desconhecida';
                final buildNumber = snapshot.data?.buildNumber ?? '';
                return CustomText(
                  type: CustomTextEnum.primary,
                  text: 'Versão: $version+$buildNumber',
                  color: ColorsTheme.transparentGrey,
                );
              }
            },
          ),
        ],
      );
    } else if (type == CustomTextEnum.small) {
      return Text(
        text!,
        style: (style ?? const TextStyle()).copyWith(
          fontSize: AppStyleConfiguration.smallText,
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
