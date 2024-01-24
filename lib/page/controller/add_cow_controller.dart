import 'package:get/get.dart';
import '../api/connection/api_add_cow.dart/add_cow.dart';

class AddCowController extends GetxController {
  Future<String> futureBuilding = Future.value('');

  Future<String> postFutureBuilding() async {
    AddCow addCow = AddCow();
    final model = await addCow.postAddCow();
    return model;
  }

  Future<void> uploadCowData() async {
    futureBuilding = postFutureBuilding();
    futureBuilding.then((value) {
      print('Future value: $value');
    });
  }
}