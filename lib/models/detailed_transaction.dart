
import 'package:untitled_flutter_pr/models/base_transaction.dart';
import 'package:untitled_flutter_pr/shared/helpers/app_randomizer.dart';

class DetailedTransaction extends BaseTransaction {
  final DateTime date;
  final double commission;

  DetailedTransaction({required super.id})
      : date = AppRandomizer().getRandomDate(),
        commission = AppRandomizer().getRandomCommission();
}