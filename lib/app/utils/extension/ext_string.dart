// ignore_for_file: unnecessary_this

import 'package:intl/intl.dart';

extension Number on String {
  String toSatuan() {
    final angka = double.parse(this).toInt();
    final currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: '',
      decimalDigits: 0,
    );
    return currencyFormatter.format(angka);
  }

  String isNumber() {
    final currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: '',
      decimalDigits: 0,
    );
    final checkAngka = this;

    if (checkAngka.contains('.0000')) {
      final data = checkAngka.replaceAll('.0000', '');
      final angka = double.parse(data).toInt();
      return currencyFormatter.format(angka);
    }
    return this;
  }

  String isJudul() {
    if (this.contains('-')) {
      final d = this.replaceAll('-', ' ');
      final h = d.split(' ');
      if (h.length < 3) {
        return toBeginningOfSentenceCase('${h[0]} ${h[1]}')!;
      } else {
        return toBeginningOfSentenceCase('${h[1]} ${h[2]}')!;
      }
    } else {
      return this;
    }
  }
}
