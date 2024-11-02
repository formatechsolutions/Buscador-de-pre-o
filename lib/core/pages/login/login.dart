import 'package:busca_preco/core/pages/custom/custom_text_transparent.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:busca_preco/core/src/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final ColorController colorController = Get.put(ColorController());

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Obx(
        () => Container(
          color: colorController.backgroundColor.value,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/rectangle.png'),
                repeat: ImageRepeat.noRepeat,
                filterQuality: FilterQuality.high,
                alignment: Alignment.topCenter,
              ),
              Column(
                children: [
                  Image(
                    image: const AssetImage('assets/icons/icon.png'),
                    height: screenHeight * 0.15,
                    filterQuality: FilterQuality.high,
                    alignment: Alignment.center,
                  ),
                  Transform.translate(
                    offset: const Offset(0, -10),
                    child: Text(
                      "BuscaPreço",
                      style: TextStyle(
                        fontSize: screenWidth * 0.09,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w900,
                        color: ColorsConfig.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      debugPrint('Received click');
                    },
                    child: const Text('Registrar'),
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                    width: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Get.toNamed('/home');
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
              const SizedBox(height: 140.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder<PackageInfo>(
                    future: PackageInfo.fromPlatform(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text('Carregando versão...');
                      } else if (snapshot.hasError) {
                        return const Text('Erro ao carregar versão');
                      } else {
                        final version =
                            snapshot.data?.version ?? 'Desconhecida';
                        final buildNumber = snapshot.data?.buildNumber ?? '';
                        return CustomTextTransparent(
                          text: 'Versão: $version+$buildNumber',
                          color: ColorsConfig.transparentGrey,
                        );
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
