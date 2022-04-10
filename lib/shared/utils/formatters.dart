import 'package:intl/intl.dart';

class Formatters {}

extension MoneyDouble on double {
  String reais() {
    final real = NumberFormat.simpleCurrency(locale: 'pt-br');
    return real.format(this);
  }
}

extension DateTimeString on DateTime {
  String formatToDayMonth() {
    return DateFormat('d MMMM', 'pt-br').format(this);
  }
}
