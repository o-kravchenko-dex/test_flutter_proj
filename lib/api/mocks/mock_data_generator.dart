import 'package:hive/hive.dart';
import 'package:untitled_flutter_pr/models/detailed_transaction.dart';

const transactionsBoxKey = "transactions";

class MockDataGenerator {
  static Future<void> generateTransactions() async {
    final transactionsBox = Hive.box<DetailedTransaction>(transactionsBoxKey);
  }
}