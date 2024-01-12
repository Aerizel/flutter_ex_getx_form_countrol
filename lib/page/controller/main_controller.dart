//import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ImagePickerController extends GetxController {
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

  /*Future _setImageSize() async {
    final Image image = Image.file(File(selectedImagePath.value));
    final Completer<Size> completer = Completer<Size>();
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(Size(
          info.image.width.toDouble(),
          info.image.height.toDouble(),
        ));
      }),
    );

    final Size imageSize = await completer.future;
    updateImageHeight(imageSize.height);
  }

  void updateImageHeight(double height) {
    imageHeight.value = height;
    update(); 
  }*/
}

class DatePickerController extends GetxController {
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

  //Prevent memory from leaking
  @override
  void onClose() {
    dateTextController.dispose();
    super.onClose();
  }
}

class GenderController extends GetxController {
  var genderType = 'female'.obs;

  void switchGender(String pickGender) {
    pickGender == 'male' ? genderType.value = 'male' : genderType.value = 'female';
  }
}

class BreedsController extends GetxController {
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
}

class BtnNumberCowAddtional extends GetxController {
  var buttonStatus = false.obs;

  void switchStatus()  {
    buttonStatus.value = !buttonStatus.value;
    update();
  }
}
