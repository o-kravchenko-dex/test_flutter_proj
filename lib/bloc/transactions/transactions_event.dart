part of "transactions_bloc.dart";

@immutable
abstract class TransactionsBlocEvent {
  const TransactionsBlocEvent();
}

class TransactionsEventLoadData extends TransactionsBlocEvent {
  final LoadState loadState;
  final Completer<bool> asyncCompletionHandler = Completer<bool>();

  TransactionsEventLoadData({this.loadState = LoadState.loading});
}

class TransactionEventDeleteTransaction extends TransactionsBlocEvent {
  final int transactionId;
  final LoadState loadState;
  final Completer<bool> asyncCompletionHandler = Completer<bool>();

  TransactionEventDeleteTransaction({this.loadState = LoadState.loading, required this.transactionId});
}