// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:busca_preco/core/pages/custom/appBar/simple_app_bar.dart';
import 'package:busca_preco/core/pages/custom/button/custom_button_main.dart';
import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:busca_preco/core/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    // final double screenWidth = MediaQuery.of(context).size.width;

    return GetBuilder<LoginController>(
      init: _loginController,
      builder: (controller) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: SimpleAppBar.build(),
        body: Obx(
          () => SingleChildScrollView(
            child: Container(
              color: ColorController().backgroundColor.value,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Form(
                  key: _loginController.formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: ColorsTheme.primary,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      const SizedBox(height: 10),
                      Image(
                        image:
                            const AssetImage('assets/images/banner_login.png'),
                        repeat: ImageRepeat.noRepeat,
                        filterQuality: FilterQuality.high,
                        alignment: Alignment.topCenter,
                        height: screenHeight * 0.4,
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: TextField(
                            controller: _loginController.emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: const TextStyle(
                                  color: Color.fromARGB(255, 85, 85, 85),
                                  fontSize: 15),
                              prefixIcon: const Icon(Icons.person),
                              prefixIconColor: Colors.grey,
                              filled: true,
                              fillColor: ColorsTheme.primary.withOpacity(0.2),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => Center(
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40.0),
                              child: TextField(
                                controller: _loginController.senhaController,
                                obscureText:
                                    !_loginController.showPassword.value,
                                decoration: InputDecoration(
                                  labelText: 'Senha',
                                  labelStyle: const TextStyle(
                                      color: Color.fromARGB(255, 85, 85, 85),
                                      fontSize: 15),
                                  prefixIcon: const Icon(Icons.lock),
                                  prefixIconColor: Colors.grey,
                                  filled: true,
                                  fillColor:
                                      ColorsTheme.primary.withOpacity(0.2),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide.none,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _loginController.showPassword.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed:
                                        _loginController.showPasswordToggle,
                                  ),
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(height: 60),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: CustomButton(
                            text: 'Login',
                            colorButton: ColorsTheme.primary,
                            colorBackground: true,
                            onPressed: _loginController.login,
                            buttonEnum: CustomButtonEnum.secondary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Esqueceu sua senha? ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: ColorsTheme.primary,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  'Clique aqui',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: ColorsTheme.primary,
                                    fontFamily: 'Roboto',
                                    decoration: TextDecoration.underline
                                  ),
                                ),
                              ),
                            ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
