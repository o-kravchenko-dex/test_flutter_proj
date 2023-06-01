import 'package:hive/hive.dart';
import 'package:untitled_flutter_pr/models/base_transaction.dart';
import 'package:untitled_flutter_pr/shared/helpers/app_randomizer.dart';

part "detailed_transaction.g.dart";

@HiveType(typeId: 2)
class DetailedTransaction extends BaseTransaction {
  @HiveField(4)
  final DateTime date;
  @HiveField(5)
  final double commission;

  DetailedTransaction({required super.id})
      : date = AppRandomizer().getRandomDate(),
        commission = AppRandomizer().getRandomCommission();

  static DetailedTransaction fromJson(Map<String, dynamic> json) => DetailedTransaction(
        id: json["id"],
      );
}
