import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';
import '../../model/label.dart';
import '../cowlist/body.dart';
import 'image_picker.dart';
import 'cow_mother_input.dart';
import 'cow_father_input.dart';
import 'cow_serial.dart';
import 'cow_serial_addtional.dart';
import 'cow_name_input.dart';
import 'cow_status.dart';
import 'cow_birthdate.dart';
import 'cow_gender.dart';
import 'cow_breeds_btn.dart';
import 'cow_breeds_display.dart';
import 'cow_breeds_text.dart';
import 'cow_shelter.dart';
import 'cow_group.dart';
import 'submit_dialog.dart';

class AddBirth extends StatelessWidget {
  AddBirth({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const CowList()),
                    );
                  },
                  icon: const Icon(Icons.arrow_back_rounded, size: 35)),
              title: const Text(
                screenTitle,
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: ImagePicker(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.pinkAccent),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              CowMotherInput(formKey: formKey),
                              const SizedBox(height: 15.0),
                              CowFatherInput(formKey: formKey),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.pinkAccent),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CowSerial(formKey: formKey),
                              const SizedBox(height: 10.0),
                              CowSerialAddtional(formKey: formKey),
                              const SizedBox(height: 10.0),
                              CowNameInput(formKey: formKey),
                              const SizedBox(height: 15.0),
                              CowBirthDate(formKey: formKey),
                              const Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text(
                                    labelCowType,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black),
                                  )),
                              const CowGender(),
                              const SizedBox(height: 20.0),
                              CowStatus(formKey: formKey),
                              const SizedBox(height: 20.0),
                              const Text(
                                labelBreeds,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const SizedBox(height: 10.0),
                              const CowBreedsBtn(),
                              const SizedBox(height: 20.0),
                              const CowBreedsDisplay(),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: Divider(
                                  color: Colors.grey[400],
                                  height: 3,
                                  thickness: 1,
                                ),
                              ),
                              const CowBreedsText(),
                              const SizedBox(height: 20.0),
                              CowShelter(formKey: formKey),
                              const SizedBox(height: 20.0),
                              CowGroup(formKey: formKey),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SubmitDialog(formKey: formKey),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
