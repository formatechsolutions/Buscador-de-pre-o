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
              controller.barCode.isNotEmpty ? Container(
                height: 350,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: ColorsTheme.buttonGrey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
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
                                ),
                              ),
                              style: TextStyle(
                                color:
                                    ColorsTheme.textBlack,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Icon(
                            Icons
                                .check_circle,
                            color: ColorsTheme.textBlack,
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 20,
                        indent: 0,
                        endIndent: 0,
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
                                hintText: 'Nome do produto',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              style: TextStyle(
                                color:
                                    ColorsTheme.textBlack,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Icon(
                            Icons
                                .check_circle,
                            color: ColorsTheme.textBlack,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ) : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
