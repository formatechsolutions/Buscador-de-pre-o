import 'package:busca_preco/core/pages/custom/button/custom_button.dart';
import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:busca_preco/core/pages/home/components/announcement_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final RxInt currentPage = 0.obs;
  final RxBool isFinalized = false.obs;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Obx(() {
        if (isFinalized.value) {
          return Container(
            color: ColorController().backgroundColor.value,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                const Image(
                  image: AssetImage('assets/images/registerPage.png'),
                  repeat: ImageRepeat.noRepeat,
                  filterQuality: FilterQuality.high,
                  alignment: Alignment.center,
                ),
                SizedBox(height: screenHeight * 0.03),
                const Text(
                  "Crie uma conta no\nBuscaPreço!",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: ColorsTheme.textGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.01),
                const Text(
                  "Tenha acesso a várias funcionalidades\npara facilitar a sua gestão de\nmercadorias!",
                  style: TextStyle(
                    fontSize: 20,
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
                      onPressed: () {},
                      text: 'Registrar',
                      colorButton: ColorsTheme.primary,
                      colorBackground: true,
                      buttonEnum: CustomButtonEnum.secondary,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: CustomButton(
                      onPressed: () {},
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
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("Termos de serviço clicado");
                          },
                      ),
                      const TextSpan(
                        text: " e ",
                      ),
                      TextSpan(
                        text: "Política de Privacidade",
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("Política de Privacidade clicada");
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        } else {
          return AnnouncementComponent(
            currentPage: currentPage,
            onFinalizar: () => isFinalized.value = true,
          );
        }
      }),
    );
  }
}
