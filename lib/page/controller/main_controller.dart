//import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class MainController extends GetxController {
  //Image controller
  var selectedImagePath = ''.obs;

  Future pickGalleyImage() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImagePath.value = image.path;
    }
  }

  Future pickCameraImage() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      selectedImagePath.value = image.path;
    }
  }

  void clearSelectedImage() {
    selectedImagePath.value = '';
  }

  //Date controller
  var countBirthDate = '0'.obs;
  TextEditingController dateTextController = TextEditingController();

  void selectedDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now());
    if (pickedDate != null) {
      //fomat date to thai language
      //var formatter = DateFormat.yMMMMEEEEd('th');
      String month = DateFormat('MMMM', 'th').format(pickedDate);
      var formatDatetoTH = "${pickedDate.day} $month ${pickedDate.year + 543}";
      dateTextController.text = formatDatetoTH;
      //submitForm.updateBirthDate(formatDatetoTH);

      //Compare date
      DateTime currentDate = DateTime.now();
      Duration diff = currentDate.difference(pickedDate);
      countBirthDate.value = diff.inDays.toString(); 
    }
  }

  @override 
  void onClose() { //Prevent memory from leaking
    dateTextController.dispose();
    super.onClose();
  }

  //Gender controller
  var genderType = 'female'.obs;

  void switchGender(String pickGender) {
    pickGender == 'male' ? genderType.value = 'male' : genderType.value = 'female';
  }

  //Breeds controller
  var buttonStatus = ''.obs;
  var showRatio = false.obs;

  void switchBreeds(int pickBreeds) {
    if(pickBreeds == 1) {
      buttonStatus.value = 'breeds5';
    } else if(pickBreeds == 2) {
      buttonStatus.value = 'breeds8';
    } else if(pickBreeds == 3) {
      showRatio.value = !showRatio.value;
    }
  }

  //Button cow additional controller
  var buttonCowStatus = false.obs;

  void switchStatus()  {
    buttonCowStatus.value = !buttonCowStatus.value;
    update();
  }
}
