import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';
import '../../model/label.dart';
import '../validators.dart';

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
          validator: Validators.compose([
            Validators.required("กรุณาระบุเบอร์ลูกโคด้วย"),
          ],),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: [
            FilteringTextInputFormatter.deny(
              RegExp('^ +'),
            ),
          ],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: labelSerial,
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        );
      },
    );
  }
}
