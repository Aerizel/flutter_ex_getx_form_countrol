import 'package:get/get.dart';
import '../api/connection/api_cow/add_cow.dart';
import '../model/form_model.dart';

class AddCowController extends GetxController {

  Future<String> uploadStatus = Future.value('');

  Future<String> futureCowData(InformBabyCow cowData) async {
    final model = await AddCow.postAddCow(cowData);
    return model;
  }

  Future<void> uploadCowData(InformBabyCow cowData) async {  
    uploadStatus = futureCowData(cowData);
  }
}