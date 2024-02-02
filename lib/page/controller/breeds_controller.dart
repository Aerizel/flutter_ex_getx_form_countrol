import 'package:get/get.dart';
import '../controller/main_controller.dart';
class BreedsController extends GetxController {
  var buttonStatus = ''.obs;
  var showRatio = false.obs;

  void switchBreeds(int pickBreeds, MainController controller) {
    if(pickBreeds == 1) {
      buttonStatus.value = 'breeds5';
    } else if(pickBreeds == 2) {
      buttonStatus.value = 'breeds8';
    } else if(pickBreeds == 3) {
      showRatio.value = !showRatio.value;
    }

    controller.update();
  }

  //Button cow additional controller
  var buttonCowStatus = false.obs;

  void switchStatus(MainController controller)  {
    buttonCowStatus.value = !buttonCowStatus.value;
    controller.update();
  }
}