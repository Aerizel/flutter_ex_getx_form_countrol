import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controller/main_controller.dart';

class ImageController extends GetxController {
  var selectedImagePath = ''.obs;

  Future pickGalleyImage(MainController controller) async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImagePath.value = image.path;
      controller.update();
    }
  }

  Future pickCameraImage(MainController controller) async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      selectedImagePath.value = image.path;
      controller.update();
    }
  }

  void clearSelectedImage(MainController controller) {
    selectedImagePath.value = '';
    controller.update();
  }
}