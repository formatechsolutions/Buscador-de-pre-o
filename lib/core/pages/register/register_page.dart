// ignore_for_file: use_key_in_widget_constructors, file_names, use_super_parameters

import 'package:busca_preco/core/pages/custom/appBar/simple_app_bar.dart';
import 'package:busca_preco/core/pages/custom/button/secondary_button.dart';
import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:busca_preco/core/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController _registerController = RegisterController();

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: _registerController,
      builder: (controller) => Scaffold(
        appBar: SimpleAppBar(),
        body: Obx(
          () => SingleChildScrollView(
              child: Container(
                  color: ColorController().backgroundColor.value,
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _registerController.formKey,
                        child: Column(
                          children: [
                            TextField(
                              controller: _registerController.nomeController,
                              decoration: const InputDecoration(
                                labelText: 'Nome',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 15),
                                prefixIcon: Icon(Icons.person),
                                prefixIconColor: Colors.grey,
                                filled: true,
                                fillColor: Color.fromARGB(255, 233, 231, 231),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              controller: _registerController.emailController,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 15),
                                prefixIcon: Icon(Icons.person),
                                prefixIconColor: Colors.grey,
                                filled: true,
                                fillColor: Color.fromARGB(255, 233, 231, 231),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Obx(() => TextField(
                                  controller:
                                      _registerController.senhaController,
                                  obscureText:
                                      !_registerController.showPassword.value,
                                  decoration: InputDecoration(
                                    labelText: 'Senha',
                                    labelStyle: const TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    prefixIcon: const Icon(Icons.lock),
                                    prefixIconColor: Colors.grey,
                                    filled: true,
                                    fillColor: const Color.fromARGB(
                                        255, 233, 231, 231),
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide.none,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _registerController.showPassword.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                                      onPressed: _registerController
                                          .showPasswordToggle,
                                    ),
                                  ),
                                )),
                            const Spacer(),
                            CustomSecondaryButton(
                              text: 'Registrar',
                              colorButton: ColorsController.primary,
                              colorBackground: true,
                              onPressed: _registerController.register,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      )))),
        ),
      ),
    );
  }
}
