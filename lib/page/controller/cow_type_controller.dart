import 'package:get/get.dart';
import '../api/connection/api_cow/get_cow_type.dart';
import '../model/cow_type_model.dart';

class CowTypeController extends GetxController {

  Future<List<CowType>> futureCowType = Future.value([]);

  Future<List<CowType>> getCowType() async {
    final model = await GetCowType.getCowTypeData();
    return model;
  }

  Future<void> fetchCowTypeData() async {
    futureCowType = getCowType();
  }
}