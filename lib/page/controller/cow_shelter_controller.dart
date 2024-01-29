import '../api/connection/api_cow/get_cow_shelter.dart';
import '../model/cow_shelter.dart';

class CowShelterController {
  Future<List<CowShelterModel>> futureShelter = Future.value([]);

  Future<List<CowShelterModel>> getCowShelterData() async {
    final model = await GetCowShelter.getCowShelterData();
    return model;
  }

  Future<void> fetchCowShelter() async {
    futureShelter = getCowShelterData();
  }
}