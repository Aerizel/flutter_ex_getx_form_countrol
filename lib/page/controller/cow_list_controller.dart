import 'package:get/get.dart';

import '../api/connection/api_cow/get_cow_list.dart';
import '../model/cow_list_model.dart';

class CowListController extends GetxController{
  Future <List<CowListModel>> futureCowList = Future.value([]);

  Future<List<CowListModel>> getCowList() async {
    var model = await GetCowList.getCowListData();
    return model;
  }

  Future<void> fetchCowListData() async {
    futureCowList = getCowList();
  }
}