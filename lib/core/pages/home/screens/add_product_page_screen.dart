import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:busca_preco/core/pages/home/screens/controllers/add_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:busca_preco/core/pages/custom/colors_controller.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class AddProductPageScreen extends StatelessWidget {
  AddProductPageScreen({super.key});

  final AddProductController controller = Get.put(AddProductController());

  Future<void> _checkCameraPermission(BuildContext context) async {
    final permission = Permission.camera;

    if (await permission.isDenied) {
      await permission.request();
    } else if (await permission.isPermanentlyDenied) {
      await openAppSettings();
    } else if (await permission.isGranted) {
      await _scanBarcode(context);
    }
  }

  Future<void> _scanBarcode(BuildContext context) async {
    try {
      var result = await BarcodeScanner.scan();
      if (result.rawContent.isNotEmpty) {
        controller.setBarCode(result.rawContent);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Código escaneado: ${result.rawContent}')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nenhum código escaneado')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao escanear código')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: ColorsTheme.backgroundApp,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Adicionar produto',
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _checkCameraPermission(context),
                  child: Container(
                    height: 150,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: ColorsTheme.textGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Clique aqui para escanear o código de barras',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    controller.barCode.isNotEmpty
                        ? 'Código escaneado: ${controller.barCode}'
                        : 'Nenhum código escaneado',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                controller.barCode.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color: ColorsTheme.textBlack,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Nome do produto',
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                          ),
                                        ),
                                        controller: controller.nameController,
                                        style: TextStyle(
                                          color: ColorsTheme.textBlack,
                                          fontSize: 16,
                                        ),
                                        onChanged: (text) {
                                          controller
                                              .updateNameIcon();
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Obx(
                                      () => Icon(
                                        controller.isNameValid.value
                                            ? Icons.check_circle
                                            : Icons.close_rounded,
                                        color: controller.isNameValid.value
                                            ? ColorsTheme.primary
                                            : ColorsTheme.red,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color: ColorsTheme.textBlack,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Descrição do produto',
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                          ),
                                        ),
                                        style: TextStyle(
                                          color: ColorsTheme.textBlack,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    controller.nameController.text.isNotEmpty
                                        ? Icon(
                                            Icons.check_circle,
                                            color: ColorsTheme.primary,
                                          )
                                        : Icon(
                                            Icons.close_rounded,
                                            color: ColorsTheme.red,
                                          ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
