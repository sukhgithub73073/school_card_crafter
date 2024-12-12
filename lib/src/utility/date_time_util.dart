import 'package:intl/intl.dart';

class DateTimeUtil {
  static String getCurrentDate() {
    final String formattedDate =
        DateFormat('yyyy-MM-dd').format(DateTime.now());
    print(formattedDate);
    return formattedDate;
  }
}
