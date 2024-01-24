import 'package:get/get.dart';
import 'form_controller.dart';
import 'image_controller.dart';
import 'birthdate_controller.dart';
import 'gender_controller.dart';
import 'breeds_controller.dart';
import 'additional_controller.dart';

class MainController extends GetxController {
  //==================== form controller ====================//
  SubmitForm submitForm = Get.put(SubmitForm());
  
  //==================== Image controller ====================//
  ImageController imageController = Get.put(ImageController());

  //==================== Date controller ====================//
  BirthDateController birthDateController = Get.put(BirthDateController());

  //==================== Gender controller ====================//
  GenderController genderController = Get.put(GenderController());

  //==================== Breeds controller ====================//
  BreedsController breedsController = Get.put(BreedsController());

  //==================== cow additional controller ====================//
  AdditionalController additionalController = Get.put(AdditionalController());

}
