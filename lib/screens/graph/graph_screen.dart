import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:untitled_flutter_pr/bloc/bloc.dart';
import 'package:untitled_flutter_pr/models/detailed_transaction.dart';
import 'package:untitled_flutter_pr/shared/shared.dart';

class GraphScreen extends StatefulWidget {
  final String title;

  const GraphScreen({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  late final TransactionsBloc transactionsBloc;

  @override
  void initState() {
    transactionsBloc = context.read<TransactionsBloc>();

    super.initState();
  }

  Map<String, double> _getTransactionsMap(List<DetailedTransaction> transactions) {
    Map<String, double> resultMap = {};
    for (var transaction in transactions) {
      final typeString = StringHelpers().getTransactionNameByType(transaction.type);
      final amount = transaction.amount;

      resultMap.update(typeString, (value) => value + amount, ifAbsent: () => amount);
    }

    return resultMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(widget.title),
      body: BlocBuilder<TransactionsBloc, TransactionsState>(
        bloc: transactionsBloc,
        builder: (context, state) {
          final transactions = state.transactionsList;
          if (transactions != null) {
            return PieChart(
              dataMap: _getTransactionsMap(transactions),
              chartType: ChartType.ring,
              ringStrokeWidth: 80,
              chartRadius: MediaQuery.of(context).size.width / 2,
              legendOptions: const LegendOptions(
                legendPosition: LegendPosition.bottom
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
