part of "transactions_bloc.dart";

class TransactionsState {
  final LoadState loadState;
  final List<DetailedTransaction>? transactionsList;
  final String? error;

  TransactionsState({this.transactionsList, this.loadState = LoadState.uninitialized, this.error});

  TransactionsState.initial() : this();

  TransactionsState copyWith({LoadState? loadState, List<DetailedTransaction>? transactionsList, String? error}) {
    return TransactionsState(
      loadState: loadState ?? this.loadState,
      transactionsList: transactionsList ?? this.transactionsList,
      error: error ?? this.error
    );
  }

  toJson() => {
    "error": error,
    "loadState": loadState.toJson(),
    "transactionsList": transactionsList,
  };

  static TransactionsState fromJson(Map<String, dynamic> json) => TransactionsState(
    transactionsList: json["transactionsList"],
    loadState: json['loadState'],
    error: json["error"],
  );

  static List<DetailedTransaction> listFromJson(List? json) => (json ?? []).map((e) => DetailedTransaction.fromJson(e)).toList();

}
