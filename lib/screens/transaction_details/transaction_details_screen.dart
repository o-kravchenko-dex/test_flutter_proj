import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled_flutter_pr/models/detailed_transaction.dart';
import 'package:untitled_flutter_pr/models/transaction_type.dart';
import 'package:untitled_flutter_pr/screens/transaction_details/base_text_row.dart';
import 'package:untitled_flutter_pr/screens/transaction_details/transaction_detail_floating_button.dart';
import 'package:untitled_flutter_pr/shared/helpers/helpers.dart';
import 'package:untitled_flutter_pr/shared/widgets/label/label.dart';
import 'package:untitled_flutter_pr/styles/styles.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final DetailedTransaction transaction;

  const TransactionDetailsScreen(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(AppIcons.back, color: AppColors.black),
          onPressed: () {
            GoRouter router = GoRouter.of(context);
            return router.pop();
          },
        ),
        title: Label("Transaction № ${transaction.transactionNumber.toString()}"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: TransactionDetailsFloatingButton(transactionId: transaction.id),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  BaseTextRow(
                    title: "Transaction type: ",
                    description: _getTransactionName(transaction.type),
                    titleStyleType: TypographyStylesTypes.large,
                    descriptionStyleType: TypographyStylesTypes.large,
                  ),
                  const Spacer(),
                  BaseTextRow(
                    title: "№ ",
                    description: transaction.transactionNumber.toString(),
                    titleStyleType: TypographyStylesTypes.large,
                    descriptionStyleType: TypographyStylesTypes.large,
                  ),
                ],
              ),
              BaseTextRow(
                title: "Transaction date: ",
                description: _transactionDateString(transaction.date),
              ),
              Row(
                children: [
                  BaseTextRow(
                    title: "Amount: ",
                    description: transaction.amount.toString(),
                  ),
                  const Spacer(),
                  BaseTextRow(
                    title: "Commission: ",
                    description: transaction.commission.toString(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getTransactionName(TransactionType type) => StringHelpers().getTransactionNameByType(type);

  String _transactionDateString(DateTime transactionDate) {
    final dateString = transactionDate.toIso8601String().split("T").first;

    return dateString;
  }
}
