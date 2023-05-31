import 'package:untitled_flutter_pr/models/base_transaction.dart';

class DetailedTransaction extends BaseTransaction {
  final DateTime date;
  final int commission;

  DetailedTransaction({
    required this.commission,
    required this.date,
    required super.type,
    required super.amount,
    required super.transactionNumber,
  });
}
