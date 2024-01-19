import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';

class CowBirthDate extends StatelessWidget {
  final GlobalKey<FormState>? formKey;
  const CowBirthDate({required this.formKey, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      dispose: (state) {
        state.controller?.birthDateController.onClose();
        state.controller?.submitForm.onClose();
      },
      builder: (controller) {
        return Column(
          children: [
            TextFormField(
                controller: controller.birthDateController.dateTextController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณาระบุวันเกิดโคด้วย';
                  }
                  return null;
                },
                style: const TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  labelText: controller.label.labelBirthDate,
                  labelStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                  border: const OutlineInputBorder(),
                  suffixIcon: const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                readOnly: true,
                onTap: () {
                  controller.birthDateController.selectedDate(context);
                }),
            Transform(
              transform: Matrix4.skewX(-0.3),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Obx(
                      () => Text(
                        "อายุ: ${controller.birthDateController.countBirthDate.value} วัน",
                      ),
                    )),
              ),
            ),
          ],
        );
      },
    );
  }
}
