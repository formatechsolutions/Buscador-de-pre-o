import 'package:busca_preco/core/pages/custom/text/custom_text_transparent.dart';
import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/material.dart';

class VersionApp extends StatelessWidget {
  const VersionApp({super.key});

  @override
  Widget build(BuildContext context) {
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
              return CustomTextTransparent(
                text: 'Versão: $version+$buildNumber',
                color: ColorsController.transparentGrey,
              );
            }
          },
        ),
      ],
    );
  }
}
