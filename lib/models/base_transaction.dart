import 'package:untitled_flutter_pr/models/models.dart';
import 'package:untitled_flutter_pr/shared/helpers/app_randomizer.dart';
import 'package:hive/hive.dart';

part "base_transaction.g.dart";

@HiveType(typeId: 1)
class BaseTransaction {
  @HiveField(0)
  final TransactionType type;
  @HiveField(1)
  final int transactionNumber;
  @HiveField(2)
  final double amount;
  @HiveField(3)
  final int id;

  BaseTransaction({required this.id})
      : type = AppRandomizer().getRandomType(),
        amount = AppRandomizer().getRandomAmount(),
        transactionNumber = AppRandomizer().getRandomInt();
}
