import '../api/connection/api_cow/get_cow_herd.dart';
import '../model/cow_herd_model.dart';

class CowHerdCotroller {
  Future<List<CowHerdModel>> futureHerd = Future.value([]);

  Future<List<CowHerdModel>> getCowHerdData() async{
    var model = await GetCowHerd.getCowHerdData();
    return model;
  }

  Future<void> fetchCowHerdData() async{
    futureHerd = getCowHerdData();
  }
}