import 'package:untitled_flutter_pr/models/models.dart';
import 'package:untitled_flutter_pr/shared/helpers/app_randomizer.dart';

class BaseTransaction {
  final TransactionType type;
  final int transactionNumber;
  final double amount;
  final int id;

  BaseTransaction({required this.id})
      : type = AppRandomizer().getRandomType(),
        amount = AppRandomizer().getRandomAmount(),
        transactionNumber = AppRandomizer().getRandomInt();
}
