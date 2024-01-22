import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';
import '../../model/label.dart';

class CowSerialAddtional extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const CowSerialAddtional({required this.formKey, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      dispose: (state) {
        state.controller?.submitForm.onClose();
      },
      builder: (controller) {
        return Column(
          children: [
            SizedBox(
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(8)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      labelSerialAddtional,
                      style: TextStyle(fontSize: 18),
                    ),
                    Obx(() {
                      return controller.additionalController.buttonCowStatus.value
                        ? const Icon(Icons.keyboard_arrow_up_rounded, size: 30)
                        : const Icon(Icons.keyboard_arrow_down_rounded,
                            size: 30);
                    }),
                  ],
                ),
                onPressed: () {
                  controller.additionalController.switchStatus();
                },
              ),
            ),
            const SizedBox(height: 10.0),
            Obx(() {
              if (controller.additionalController.buttonCowStatus.value) {
                return Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        int intValue = int.parse(value);
                        controller.submitForm.updateNid(intValue);
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: labelNid,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      onChanged: (value) {
                        int intValue = int.parse(value);
                        controller.submitForm.updateRfid(intValue);
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: labelRfid,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      onChanged: (value) {
                        int intValue = int.parse(value);
                        controller.submitForm.updateDpo(intValue);
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: labelDpo,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
          ],
        );
      },
    );
  }
}
