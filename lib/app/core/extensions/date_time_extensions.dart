import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  DateFormat get dateFormat => DateFormat('dd/MM/yyyy');

  String toStringDate() => dateFormat.format(this);
}
