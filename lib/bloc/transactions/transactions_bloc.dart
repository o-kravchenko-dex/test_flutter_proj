import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled_flutter_pr/api/api.dart';
import 'package:untitled_flutter_pr/bloc/bloc.dart';
import 'package:untitled_flutter_pr/models/detailed_transaction.dart';

part "transactions_event.dart";

part "transactions_state.dart";

class TransactionsBloc extends HydratedBloc<TransactionsBlocEvent, TransactionsState> {
  TransactionsBloc() : super(TransactionsState.initial()) {
    on<TransactionsEventLoadData>(_loadTransactionsData);
    on<TransactionEventDeleteTransaction>(_deleteTransaction);
  }

  Future<void> _loadTransactionsData(TransactionsEventLoadData event, Emitter<TransactionsState> emit) async {
    try {
      emit(state.copyWith(loadState: event.loadState, transactionsList: state.transactionsList));
      final transactions = await MockDataGenerator().getTransactions();
      emit(state.copyWith(loadState: LoadState.idle, transactionsList: transactions));
      event.asyncCompletionHandler.complete(true);
    } catch (error) {
      emit(state.copyWith(
        loadState: LoadState.error,
        error: error.toString(),
      ));
    }
  }

  Future<void> _deleteTransaction(TransactionEventDeleteTransaction event, Emitter<TransactionsState> emit) async {
    try {

      emit(state.copyWith(loadState: event.loadState, transactionsList: state.transactionsList));

      MockDataGenerator().removeTransaction(event.transactionId);

      final transactions = await MockDataGenerator().getTransactions();

      emit(state.copyWith(loadState: LoadState.idle, transactionsList: transactions));
      event.asyncCompletionHandler.complete(true);
    } catch (error) {
      emit(state.copyWith(
        loadState: LoadState.error,
        error: error.toString(),
      ));
    }
  }

  @override
  TransactionsState? fromJson(Map<String, dynamic> json) {
    return TransactionsState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(TransactionsState state) {
    return TransactionsState().toJson();
  }
}
