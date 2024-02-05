import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../api.dart';
import '../../../model/cow_list_model.dart';

class GetCowList extends GetxController{
  static Future<List<CowListModel>> getCowListData() async {
    try {
      final res = await zyanDairyApi.get('/getCow');

      List json = res.data;
      List<CowListModel> list = [];
      list = json.map((data) => CowListModel.fromJson(data)).toList();
      return list;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}