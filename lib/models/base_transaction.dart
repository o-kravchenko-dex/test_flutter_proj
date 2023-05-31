import 'package:untitled_flutter_pr/models/models.dart';

class BaseTransaction {
  final TransactionType type;
  final int transactionNumber;
  final double amount;

  BaseTransaction({
    required this.type,
    required this.transactionNumber,
    required this.amount,
  });
}


