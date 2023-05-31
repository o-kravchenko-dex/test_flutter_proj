import 'package:hive/hive.dart';
import 'package:untitled_flutter_pr/models/detailed_transaction.dart';

const baseBoxKey = "baseBox";
const transactionsBoxKey = "transactions";

class MockDataGenerator {

  init() async {
    _generateTransactions();
  }

  static Future<void> _generateTransactions() async {
    final box = await Hive.openBox(baseBoxKey);

    final List<DetailedTransaction> transactions = List.generate(20, (index) => DetailedTransaction(id: index));

    await box.put(transactionsBoxKey, transactions);
  }

   void removeTransaction(int transactionId) {
    final baseBox = Hive.box(baseBoxKey);

    final transactionList = baseBox.get(transactionsBoxKey);

    transactionList.removeWhere((transaction) => transactionId == transaction.id);

    baseBox.put(transactionsBoxKey, transactionList);
  }
}
