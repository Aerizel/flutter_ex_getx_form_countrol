import 'package:dio/dio.dart';
import '../../../model/cow_type_model.dart';
import '../../api.dart';

class GetCowType {
  static Future<List<CowType>> getCowTypeData() async {
    try {
      final res = await zyanDairyApi.get('/getCowType');
      
      List json = res.data;
      List<CowType> list = [];
      list = json.map((data) => CowType.fromJson(data)).toList();
    
      return list;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}