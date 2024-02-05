import 'package:get/get.dart';
import 'form_controller.dart';
import 'image_controller.dart';
import 'birthdate_controller.dart';
import 'gender_controller.dart';
import 'breeds_controller.dart';
import 'additional_controller.dart';
import 'add_cow_controller.dart';
import 'cow_type_controller.dart';
import 'cow_shelter_controller.dart';
import 'cow_herd_controller.dart';
import 'cow_list_controller.dart';

class MainController extends GetxController {
  //------------------------------------------ Add cow controller -----------------------------------//
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

  //==================== Add cow controller ====================//
  AddCowController addCowController = Get.put(AddCowController());

  //==================== cow type controller ====================//
  CowTypeController cowTypeController = Get.put(CowTypeController());

  //==================== cow shelter controller ====================//
  CowShelterController cowShelterController = Get.put(CowShelterController());

  //==================== cow herd controller ====================//
  CowHerdCotroller cowHerdCotroller = Get.put(CowHerdCotroller());
  //-------------------------------------------------------------------------------------------------//

  //------------------------------------------ Add cow controller -----------------------------------//
  //==================== cow list controller ====================//
  CowListController cowListController = Get.put(CowListController());
  //-------------------------------------------------------------------------------------------------//
}
