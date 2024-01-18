import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  DateFormat get _dateFormat => DateFormat('dd/MM/yyyy');

  String toStringDate() => _dateFormat.format(this);
}
