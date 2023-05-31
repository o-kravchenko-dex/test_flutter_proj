import 'package:hive/hive.dart';
import 'package:untitled_flutter_pr/models/detailed_transaction.dart';

const transactionsBoxKey = "transactions";

class MockDataGenerator {
  static final Box<DetailedTransaction> _transactionsBox = Hive.box<DetailedTransaction>(transactionsBoxKey);

  init() async {
    _generateTransactions();
  }

  static Future<void> _generateTransactions() async {
    final List<DetailedTransaction> transactions = List.generate(20, (index) => DetailedTransaction(id: index));

    await _transactionsBox.addAll(transactions);
  }

  static void removeTransaction(int transactionId) {
    final List<DetailedTransaction> transactionList = _transactionsBox.values.toList();
    transactionList.removeWhere((transaction) => transactionId == transaction.id);
  }
}