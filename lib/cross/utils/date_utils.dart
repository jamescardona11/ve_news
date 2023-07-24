import 'package:intl/intl.dart';

abstract final class AppDateUtils {
  static final _defaultFormattedDate = DateFormat('yyyy-MM-dd');

  static String nowStringFormat() => _defaultFormattedDate.format(DateTime.now());
  static String yesterdayStringFormat() => _defaultFormattedDate.format(DateTime.now().subtract(const Duration(hours: 24)));

  static String timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seg ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hr ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      final format = DateFormat.yMMMMd(); // Format to show the month and day.
      return 'on ${format.format(dateTime)}';
    }
  }
}
