import 'package:get/get.dart';

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

  //Button cow additional controller
  var buttonCowStatus = false.obs;

  void switchStatus()  {
    buttonCowStatus.value = !buttonCowStatus.value;
    update();
  }
}