import 'package:intl/intl.dart';

class FormatDates {
  static String formatDatetoTH(DateTime time) {
    String month = DateFormat('MMMM', 'th').format(time);
    String formatDatetoTH = "${time.day} $month ${time.year + 543}";
    return formatDatetoTH;
  }
}