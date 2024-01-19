import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';

class CowFatherInput extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const CowFatherInput({required this.formKey, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MainController(),
      dispose: (state) {
        state.controller?.submitForm.onClose();
      },
      builder: (controller) {
        return TextFormField(
          onChanged: (value) {
            controller.submitForm.updateCowFather(value);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'กรุณาระบุพ่อโค/น้ำเชื้อคลอดด้วย';
            }
            return null;
          },
          style: const TextStyle(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              labelText: controller.label.labelHerd,
              labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey),
              border: const OutlineInputBorder()),
        );
      },
    );
  }
}
