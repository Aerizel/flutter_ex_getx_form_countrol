import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';
import '../../model/label.dart';

class CowGroup extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const CowGroup({required this.formKey, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MainController(),
      dispose: (state) {
        state.controller?.submitForm.onClose();
      },
      builder: (controller) {
        return DropdownButtonFormField<String>(
          validator: (value) {
            if (value == 'เลือกฝูง') {
              return 'กรุณาเลือกฝูงด้วย';
            }
            return null;
          },
          decoration: const InputDecoration(
            labelText: labelHerd,
            labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
            border: OutlineInputBorder(),
          ),
          value: 'เลือกฝูง',
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          icon: const Icon(
            Icons.arrow_drop_down_circle_outlined,
            size: 30,
            color: Colors.black,
          ),
          items: <String>['เลือกฝูง', 'ฝูง1', 'ฝูง2', 'ฝูง3']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            controller.submitForm.updatePack(value.toString());
          },
        );
      },
    );
  }
}
