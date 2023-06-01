import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled_flutter_pr/models/detailed_transaction.dart';
import 'package:untitled_flutter_pr/routes/app_routes.dart';
import 'package:untitled_flutter_pr/shared/helpers/string_helpers.dart';
import 'package:untitled_flutter_pr/shared/widgets/label/label.dart';
import 'package:untitled_flutter_pr/styles/styles.dart';

class TransactionItem extends StatelessWidget {
  final DetailedTransaction transaction;

  const TransactionItem(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.transactionDetails, extra: transaction);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(10),
        color: AppColors.gray2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Label("Transaction: ", type: TypographyStylesTypes.large),
                Label(StringHelpers().getTransactionNameByType(transaction.type), type: TypographyStylesTypes.large),
              ],
            ),
            Row(
              children: [
                const Label("Transaction number:"),
                Label(transaction.transactionNumber.toString()),
              ],
            ),
            Row(
              children: [
                const Label("amount: "),
                Label(transaction.amount.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
