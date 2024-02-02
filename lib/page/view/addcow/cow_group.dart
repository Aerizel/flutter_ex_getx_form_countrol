import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';
import '../../model/cow_herd_model.dart';
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
        controller.cowHerdCotroller.fetchCowHerdData();
        return FutureBuilder(
          future: controller.cowHerdCotroller.futureHerd,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CowHerdModel> herdList = snapshot.data as List<CowHerdModel>;
              List<String> herdData =
                  herdList.map((data) => data.herd.toString()).toList();
              controller.submitForm.updatePack(herdData[0].toString());
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
                value: herdData[0],
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
                icon: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  size: 30,
                  color: Colors.black,
                ),
                items: herdData.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.submitForm.updatePack(value.toString());
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
