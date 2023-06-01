import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled_flutter_pr/bloc/bloc.dart';
import 'package:untitled_flutter_pr/shared/widgets/label/label.dart';
import 'package:untitled_flutter_pr/styles/styles.dart';

class TransactionDetailsFloatingButton extends StatefulWidget {
  final int transactionId;

  const TransactionDetailsFloatingButton({super.key, required this.transactionId});

  @override
  State<TransactionDetailsFloatingButton> createState() => _TransactionDetailsFloatingButtonState();
}

class _TransactionDetailsFloatingButtonState extends State<TransactionDetailsFloatingButton> {
  late final TransactionsBloc transactionsBloc;

  void _onButtonPress(TransactionEventDeleteTransaction event) {
    debugPrint('PRESS DELETE');
    transactionsBloc.add(event);
    debugPrint("remopved");
  }

  @override
  void initState() {
    transactionsBloc = context.read<TransactionsBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final removingEvent = TransactionEventDeleteTransaction(transactionId: widget.transactionId);


    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            _onButtonPress(removingEvent);
            context.pop();
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.green6,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(20),
            child: const Label('delete'),
          ),
        );
      },
    );
  }
}