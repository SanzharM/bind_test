import 'package:intl/intl.dart';

class Utils {
  static String toDatePointer(DateTime? date) {
    if (date == null) return '';

    final now = DateTime.now();
    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      return 'Today';
    } else if (date.year == now.year && date.month == now.month && date.day == now.day - 1) {
      return 'Yesterday';
    } else if (date.year == now.year && date.month == now.month && date.day == now.day + 1) {
      return 'Tommorow';
    }
    return DateFormat('EEEE, d MMM').format(date);
  }

  static String getTimeFromDate(DateTime? dateTime, {bool withSeconds = false}) {
    if (dateTime == null) return '';
    String format = 'HH:mm';
    if (withSeconds) format = 'HH:mm:ss';
    return DateFormat(format).format(dateTime);
  }
}
