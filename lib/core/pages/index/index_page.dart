import 'package:busca_preco/core/backend/local_storage.dart';
import 'package:busca_preco/core/pages/errors/404/error_404.dart';

import '../custom/button/custom_button.dart';
import '../custom/colors_controller.dart';
import 'components/announcement_page.dart';
import '../../routes/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexPage extends StatelessWidget {
  final RxInt currentPage = 0.obs;
  final LocalStorage localStorage = LocalStorage();
  final RxString isFinalizedPagesHome = 'false'.obs;

  IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RxString>(
      future: localStorage.getContentSessionStorage('isFinalizedPagesHome'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData) {
          isFinalizedPagesHome.value = snapshot.data!.value;

          return Scaffold(
            body: Obx(() {
              if (isFinalizedPagesHome.value == 'true') {
                return _buildRegisterPage(context);
              } else {
                return AnnouncementComponent(
                  currentPage: currentPage,
                  onFinalizar: () {
                    isFinalizedPagesHome.value = 'true';
                    localStorage.saveContentSessionStorage('isFinalizedPagesHome', 'true');
                  },
                );
              }
            }),
          );
        } else {
          return Error404();
        }
      },
    );
  }

  Widget _buildRegisterPage(context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 16),
          Image(
            image: const AssetImage('assets/images/registerPage.png'),
            repeat: ImageRepeat.noRepeat,
            filterQuality: FilterQuality.high,
            alignment: Alignment.center,
            width: size.width * 0.8,
          ),
          const SizedBox(height: 8),
          const Text(
            "Crie uma conta no\nBuscaPreço!",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: ColorsTheme.textGrey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            "Tenha acesso a várias funcionalidades\npara facilitar a sua gestão de\nmercadorias!",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: ColorsTheme.textGrey,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: CustomButton(
                onPressed: () {
                  Get.toNamed(Routes.login);
                },
                text: 'Log In',
                colorButton: ColorsTheme.primary,
                colorBackground: false,
                buttonEnum: CustomButtonEnum.secondary,
              ),
            ),
          ),
          const Spacer(),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: ColorsTheme.textGrey,
              ),
              children: [
                const TextSpan(
                  text: "Ao continuar você concorda com os\n",
                ),
                TextSpan(
                  text: "Termos de serviço",
                  style: const TextStyle(color: ColorsTheme.primary),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
                const TextSpan(
                  text: " e ",
                ),
                TextSpan(
                  text: "Política de Privacidade",
                  style: const TextStyle(color: ColorsTheme.primary),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
