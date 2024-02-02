import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';
import '../../model/label.dart';
import '../validators.dart';

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
          validator: Validators.compose([
            Validators.required("กรุณาระบุแม่โคที่คลอดด้วย"),
            Validators.minLength(3, 'กรุณาระบุชื่อให้มากกว่า 3 ตัว'),
            Validators.maxLength(20, 'กรุณาระบุชื่อไม่ให้เกิน 20 ตัว'),
          ],),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: [
            FilteringTextInputFormatter.deny(
              RegExp('^ +'),
            ),
          ],
          style: const TextStyle(fontWeight: FontWeight.bold),
          decoration: const InputDecoration(
              labelText: labelMom,
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey),
              border: OutlineInputBorder()),
        );
      },
    );
  }
}
