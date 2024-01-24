import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../controller/main_controller.dart';
import '../../api.dart';

class AddCow {
  MainController controller = Get.find<MainController>();

  Future<String> postAddCow() async {
    try {
      final res = await zyanDairyApi.post('/posts', data: {
        /*'id': 5,
        'cow_mom': controller.submitForm.cowMother,
        'cow_dad': controller.submitForm.cowFather,
        'cow_name': controller.submitForm.cowName,
        'cow_birthDate': 'today',
        'cow_gender': controller.submitForm.gender,
        'cow_status': controller.submitForm.status,
        'cow_breeds': controller.submitForm.breeds,
        /*'cow_shelter' controller.submitForm.house,*/
        'cow_herd': controller.submitForm.pack,*/
        "title": "bruh",
        "body": "bruh",
        "userId": "2"
      });

      if (res.statusCode == 200 || res.statusCode == 201) {
        print(res);
        return 'true';
      } else {
        print(res);
        return 'false';
      }
      //list = json.map((data) => )
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception("Connection  Timeout Exception");
      }
      throw Exception(e);
      //print(e);
    }
  }
}
