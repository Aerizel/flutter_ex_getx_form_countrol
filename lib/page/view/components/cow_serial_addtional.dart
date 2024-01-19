import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';

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
                    Text(
                      controller.label.labelSerialAddtional,
                      style: const TextStyle(fontSize: 18),
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
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: controller.label.labelRfid,
                        labelStyle: const TextStyle(
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
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: controller.label.labelRfid,
                        labelStyle: const TextStyle(
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
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: controller.label.labelDpo,
                        labelStyle: const TextStyle(
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
