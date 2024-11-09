import 'package:busca_preco/core/pages/custom/button/custom_button.dart';
import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnouncementComponent extends StatelessWidget {
  final RxInt currentPage = 0.obs;

  AnnouncementComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Obx(() {
      return Container(
        color: ColorController().backgroundColor.value,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: screenHeight * 0.12),
            const Image(
              image: AssetImage('assets/images/Trust.png'),
              repeat: ImageRepeat.noRepeat,
              filterQuality: FilterQuality.high,
              alignment: Alignment.center,
            ),
            SizedBox(height: screenHeight * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: 30,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentPage.value == index
                        ? ColorsTheme.primary
                        : ColorsTheme.transparentGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }),
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              currentPage.value == 0
                  ? "Junte-se ao melhor\napp para o seu\nnegócio!"
                  : currentPage.value == 1
                      ? "Organize e\nacompanhe seus\nprodutos com\nfacilidade."
                      : "Desfrute da melhor\nperformance do\nmercado!",
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
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
                    if (currentPage.value < 2) currentPage.value++;
                  },
                  text: currentPage.value < 2 ? 'Avançar' : 'Finalizar',
                  colorButton: ColorsTheme.primary,
                  colorBackground: true,
                  buttonEnum: CustomButtonEnum.secondary,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      );
    });
  }
}
