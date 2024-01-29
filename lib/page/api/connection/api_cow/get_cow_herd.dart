import 'package:dio/dio.dart';
import '../../api.dart';
import '../../../model/cow_herd_model.dart';

class GetCowHerd {
  static Future<List<CowHerdModel>> getCowHerdData() async {
    try {
      final res = await zyanDairyApi.get('/getCowHerd');

      List json = res.data;
      List<CowHerdModel> list = [];
      list = json.map((data) => CowHerdModel.fromJson(data)).toList();

      return list;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
