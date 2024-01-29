import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';
import '../../model/cow_shelter.dart';
import '../../model/label.dart';

class CowShelter extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const CowShelter({required this.formKey, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MainController(),
      dispose: (state) {
        state.controller?.submitForm.onClose();
      },
      builder: (controller) {
        controller.cowShelterController.fetchCowShelter();
        return FutureBuilder(
          future: controller.cowShelterController.futureShelter,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CowShelterModel> cowShelterList =
                  snapshot.data as List<CowShelterModel>;
              List<String> cowShelterData = cowShelterList
                  .map((cowShelter) => cowShelter.shelter.toString())
                  .toList();
              return DropdownButtonFormField<String>(
                validator: (value) {
                  if (value == 'เลือกโรงเรือน') {
                    return 'กรุณาเลือกโรงเรือนด้วย';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: labelBuilding,
                  labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
                value: cowShelterData[0],
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
                icon: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  size: 30,
                  color: Colors.black,
                ),
                items: cowShelterData.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  controller.submitForm.updateHouse(value.toString());
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
