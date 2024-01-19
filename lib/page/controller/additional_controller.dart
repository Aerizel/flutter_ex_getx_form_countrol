import 'package:get/get.dart';

class AdditionalController extends GetxController {
  var buttonCowStatus = false.obs;

  void switchStatus()  {
    buttonCowStatus.value = !buttonCowStatus.value;
    update();
  }
}