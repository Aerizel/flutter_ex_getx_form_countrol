import 'package:get/get.dart';

class GenderController extends GetxController {
  var genderType = 'female'.obs;

  void switchGender(String pickGender) {
    pickGender == 'male' ? genderType.value = 'male' : genderType.value = 'female';
    update();
  }
}