import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_form_countrol/page/model/cow_type_model.dart';
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
        controller.cowTypeController.fetchCowTypeData();
        return FutureBuilder(
          future: controller.cowTypeController.futureCowType,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CowType> cowTypeList = snapshot.data as List<CowType>;
              List<String> cowTypeData = cowTypeList
                  .map((cowType) => cowType.typeName.toString())
                  .toList();
              controller.submitForm.updateStatus(cowTypeData[0].toString());
              return DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: labelCowType,
                  labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
                value: cowTypeData[0],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                icon: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  size: 30,
                  color: Colors.black,
                ),
                items:
                    cowTypeData.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.submitForm.updateStatus(value.toString());
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}
