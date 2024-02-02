import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';
import '../../model/label.dart';

class CowGender extends StatelessWidget {
  const CowGender({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      dispose: (state) {
        state.controller?.genderController.onClose();
      },
      builder: (controller) {
        return Builder(
          builder: (context) {
            return Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        controller.genderController.genderType.value == 'female'
                            ? Colors.pink[400]
                            : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(30),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.female,
                          color: Colors.pink[400],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          labelCowGenderFemale,
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  onPressed: () {
                    controller.genderController.switchGender('female', controller);
                    controller.submitForm.updateGender('female');
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        controller.genderController.genderType.value == 'male'
                            ? Colors.blue[400]
                            : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(30),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.male,
                          color: Colors.blue[400],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          labelCowGenderMale,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    controller.genderController.switchGender('male', controller);
                    controller.submitForm.updateGender('male');
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
