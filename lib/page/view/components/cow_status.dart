import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';
import '../../model/label.dart';

class CowStatus extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const CowStatus({required this.formKey, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      dispose: (state) {
        state.controller?.submitForm.onClose();
      },
      builder: (controller) {
        return DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: labelCowType,
            labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
            border: OutlineInputBorder(),
          ),
          value: 'ลูกโค',
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          icon: const Icon(
            Icons.arrow_drop_down_circle_outlined,
            size: 30,
            color: Colors.black,
          ),
          items: <String>['ลูกโค', 'โคหนุ่ม', 'โคแก่']
              .map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            },
          ).toList(),
          onChanged: (value) {
            controller.submitForm.updateStatus(value.toString());
          },
        );
      },
    );
  }
}
