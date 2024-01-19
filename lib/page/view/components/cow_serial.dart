import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';

class CowSerial extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const CowSerial({required this.formKey, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      dispose: (state) {
        state.controller?.submitForm.onClose();
      },
      builder: (controller) {
        return TextFormField(
          onChanged: (value) {
            controller.submitForm.updateCowNumber(value);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'กรุณาระบุเบอร์ลูกโคด้วย';
            }
            return null;
          },
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: controller.label.labelSerial,
            labelStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        );
      },
    );
  }
}
