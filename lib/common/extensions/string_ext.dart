import 'package:intl/intl.dart';

extension StringExt on String {
  String get currecyFormatRp => NumberFormat.currency(
        locale: 'id',
        symbol: 'Rp. ',
        decimalDigits: 0,
      ).format(int.parse(this));
}
