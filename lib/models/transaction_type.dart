
import 'package:hive/hive.dart';

part 'transaction_type.g.dart';

@HiveType(typeId: 3)
enum TransactionType {
  @HiveField(6)
  transfer,
  @HiveField(7)
  refill,
  @HiveField(8)
  withdrawal,
}