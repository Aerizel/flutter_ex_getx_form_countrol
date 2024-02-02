import 'package:get/get.dart';
import '../controller/main_controller.dart';

class GenderController extends GetxController {
  var genderType = 'female'.obs;

  void switchGender(String pickGender, MainController controller) {
    pickGender == 'male' ? genderType.value = 'male' : genderType.value = 'female';
    controller.update();
  }
}