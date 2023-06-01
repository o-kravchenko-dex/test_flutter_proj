import 'dart:math';

import 'package:untitled_flutter_pr/models/models.dart';

class AppRandomizer {
  final _random = Random();

  TransactionType getRandomType() {
    const transactionTypeValues = TransactionType.values;

    return transactionTypeValues[_random.nextInt(transactionTypeValues.length)];
  }

  DateTime getRandomDate() {
    final randomDuration = Duration(
      days: _random.nextInt(30),
      hours: _random.nextInt(20),
      minutes: _random.nextInt(60),
      seconds: _random.nextInt(60),
    );

    return DateTime.now().subtract(randomDuration);
  }

  double getRandomAmount() {
    return getRandomInt().toDouble();
  }

  int getRandomInt() {
    return _random.nextInt(1000);
  }

  double getRandomCommission() {
    return _random.nextInt(10).toDouble();
  }
}
