import 'package:intl/intl.dart';

abstract final class DateUtils {
  static final _defaultFormattedDate = DateFormat('yyyy-MM-dd');

  static String nowStringFormat() => _defaultFormattedDate.format(DateTime.now());
  static String yesterdayStringFormat() => _defaultFormattedDate.format(DateTime.now().subtract(const Duration(hours: 24)));
}
