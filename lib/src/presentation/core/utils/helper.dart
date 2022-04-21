import 'package:intl/intl.dart';

class Helper {
  static String moneyFormat(dynamic money) {
    final formatCurrency = NumberFormat.simpleCurrency();
    return formatCurrency.format(money);
  }
}
