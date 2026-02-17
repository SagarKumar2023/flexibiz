import 'package:intl/intl.dart';

class DateFormatterUtils {
  static String formatDate(String isoDate) {
    final date = DateTime.parse(isoDate);
    return DateFormat('dd MMM yyyy').format(date);
  }

  static String formatDateTime(String isoDate) {
    final date = DateTime.parse(isoDate);
    return DateFormat('dd MMM yyyy, hh:mm a').format(date);
  }
}
