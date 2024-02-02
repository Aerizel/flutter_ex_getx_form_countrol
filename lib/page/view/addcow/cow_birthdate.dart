import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';
import '../../model/label.dart';
import '../validators.dart';

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
              validator: Validators.required('กรุณาระบุวันเกิดโคด้วย'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: const TextStyle(fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                labelText: labelBirthDate,
                labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              readOnly: true,
              onTap: () {
                controller.birthDateController.selectedDate(context);
              },
            ),
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
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
