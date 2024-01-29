import 'package:dio/dio.dart';
import '../../api.dart';
import '../../../model/cow_shelter.dart';

class GetCowShelter {
  static Future<List<CowShelterModel>> getCowShelterData() async {
    try {
      final res = await zyanDairyApi.get('/getCowShelter');

      List json = res.data;
      List<CowShelterModel> list = [];
      list = json.map((data) => CowShelterModel.fromJson(data)).toList();

      return list;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}