import 'package:untitled_flutter_pr/models/models.dart';

class StringHelpers {
  String getTransactionNameByType(TransactionType type) {
    switch (type) {
      case TransactionType.transfer:
        return "transfer";
      case TransactionType.refill:
        return "refill";
      case TransactionType.withdrawal:
        return "withdrawal";
    }
  }
}