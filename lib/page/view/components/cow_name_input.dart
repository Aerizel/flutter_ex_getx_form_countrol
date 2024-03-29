import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';
import '../../model/label.dart';

class CowNameInput extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const CowNameInput({required this.formKey, super.key});

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
            controller.submitForm.updateCowName(value);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'กรุณาระบุชื่อลูกโคด้วย';
            }
            return null;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: labelCowName,
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        );
      },
    );
  }
}
