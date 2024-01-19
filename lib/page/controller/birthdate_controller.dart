import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../controller/main_controller.dart';

class BirthDateController extends GetxController {
  var countBirthDate = '0'.obs;
  TextEditingController dateTextController = TextEditingController();

  void selectedDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now());
    if (pickedDate != null) {
      //fomat date to thai language
      //var formatter = DateFormat.yMMMMEEEEd('th');
      String month = DateFormat('MMMM', 'th').format(pickedDate);
      var formatDatetoTH = "${pickedDate.day} $month ${pickedDate.year + 543}";
      dateTextController.text = formatDatetoTH;

      //Compare date
      DateTime currentDate = DateTime.now();
      Duration diff = currentDate.difference(pickedDate);
      countBirthDate.value = diff.inDays.toString();

      //Set value to submitForm controller
      MainController controller = Get.find<MainController>();
      controller.submitForm.updateBirthDate(pickedDate);
    }
  }
}
