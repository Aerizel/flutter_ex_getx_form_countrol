import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';

class CowMotherInput extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const CowMotherInput({required this.formKey, super.key});

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
            controller.submitForm.updateCowMother(value);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'กรุณาระบุแม่โคที่คลอดด้วย';
            }
            return null;
          },
          style: const TextStyle(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              labelText: controller.label.labelMom,
              labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey),
              border: const OutlineInputBorder()),
        );
      },
    );
  }
}
