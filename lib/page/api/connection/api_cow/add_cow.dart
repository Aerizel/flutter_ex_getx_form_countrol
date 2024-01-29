import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import '../../../model/form_model.dart';
import '../../api.dart';

class AddCow {
  static Future<String> postAddCow(InformBabyCow data) async {
    try {
      final res = await zyanDairyApi.post(
        '/saveCow',
        data: [
          {
            'cow_mom': data.cowMother,
            'cow_dad': data.cowFather,
            'cow_name': data.cowName,
            'cow_birthDate': DateFormat('yyyy-MM-dd').format(data.birthDate),
            'cow_gender': data.gender,
            'cow_status': data.status,
            'cow_breeds': data.breeds,
            'cow_shelter': data.house,
            'cow_herd': data.pack,
          },
        ],
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        return 'true';
      } else {
        return 'false';
      }
      //list = json.map((data) => )
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception("Connection  Timeout Exception");
      }
      throw Exception(e);
    }
  }
}
