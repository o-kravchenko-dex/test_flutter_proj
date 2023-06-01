import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled_flutter_pr/bloc/bloc.dart';
import 'package:untitled_flutter_pr/screens/home/widgets/transaction_item.dart';
import 'package:untitled_flutter_pr/shared/widgets/label/label.dart';
import 'package:untitled_flutter_pr/styles/styles.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TransactionsBloc transactionsBloc;

  Future<void> _fetchData() async {
    final fetchDataEvent = TransactionsEventLoadData(loadState: LoadState.loading);
    transactionsBloc.add(fetchDataEvent);
  }

  @override
  void initState() {
    transactionsBloc = context.read<TransactionsBloc>();
    _fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Label(widget.title),
        backgroundColor: AppColors.green6,
      ),
      body: BlocBuilder<TransactionsBloc, TransactionsState>(
        bloc: transactionsBloc,
        builder: (BuildContext context, state) {
          final transactions = state.transactionsList;
          if (transactions != null) {
            return ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];

                return TransactionItem(transaction);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
