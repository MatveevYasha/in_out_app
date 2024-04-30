import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:in_out_app/src/feature/data/hive/expenses_deal_db.dart';
import 'package:in_out_app/src/feature/data/hive/incomes_deal_db.dart';

import 'package:in_out_app/src/feature/home/bloc/main_event.dart';
import 'package:in_out_app/src/feature/home/bloc/main_state.dart';

final _mockDeals = [
  IncomeDeal(amount: 101, date: DateTime.utc(2024, 11, 9, 9, 20), incomeType: IncomeDealType.salary),
  IncomeDeal(amount: 102, date: DateTime.utc(2024, 12, 9, 9, 21), incomeType: IncomeDealType.salary),
  IncomeDeal(amount: 103, date: DateTime.utc(2024, 12, 10, 9, 22), incomeType: IncomeDealType.salary),
  ExpensesDeal(amount: 54, date: DateTime.utc(2024, 12, 10, 9, 23), incomeType: ExpensesDealType.cafe),
  ExpensesDeal(amount: 55, date: DateTime.utc(2024, 12, 10, 9, 24), incomeType: ExpensesDealType.entertainments),
  ExpensesDeal(amount: 56, date: DateTime.utc(2023, 12, 8, 9, 25), incomeType: ExpensesDealType.supermarkets),
];

class MainBloc extends Bloc<MainEvent, MainState> {
  final Box<ExpensesDealDB> expensesDealBox;
  final Box<IncomesDealDB> incomesDealBox;

  MainBloc({
    required this.expensesDealBox,
    required this.incomesDealBox,
  }) : super(LoadingMainState()) {
    on<MainEvent>(
      (event, emit) => switch (event) {
        final InitialMainEvent event => _initial(event, emit),
        final AddDealEvent event => _addDeal(event, emit),
      },
    );
  }

  Future<void> _initial(InitialMainEvent event, Emitter<MainState> emit) async {
    try {
      final List<Deal> finalDeals = _getDeals();
      final totalAmount = _getTotalAmount(finalDeals);

      emit(
        SuccessMainState(
          deals: finalDeals,
          incomeAmount: totalAmount.incomeAmount,
          expensesAmount: totalAmount.expensesAmount,
        ),
      );
    } on Exception catch (_) {
      emit(ErrorMainState());
    }
  }

  List<Deal> _getDeals() {
    final List<ExpensesDeal> expensesDealList = [];
    final List<IncomeDeal> incomesDealList = [];

    for (final element in expensesDealBox.values) {
      expensesDealList.add(
        ExpensesDeal(
          amount: element.amount,
          date: element.date,
          incomeType: ExpensesDealType.toEnum(element.incomeType),
        ),
      );
    }

    for (final element in incomesDealBox.values) {
      incomesDealList.add(
        IncomeDeal(
          amount: element.amount,
          date: element.date,
          incomeType: IncomeDealType.toEnum(element.incomeType),
        ),
      );
    }

    final List<Deal> deals = [...expensesDealList, ...incomesDealList];

    deals.sort((a, b) => b.date.compareTo(a.date));

    return deals.where((item) => item.date.year >= DateTime.now().year).toList();
  }

  ({int incomeAmount, int expensesAmount}) _getTotalAmount(List<Deal> deals) {
    int? incomeAmount;
    int? expensesAmount;

    for (final element in deals) {
      if (element.runtimeType == IncomeDeal) {
        if (incomeAmount != null) {
          incomeAmount = incomeAmount + element.amount;
        } else {
          incomeAmount = element.amount;
        }
      }

      if (element.runtimeType == ExpensesDeal) {
        if (expensesAmount != null) {
          expensesAmount = expensesAmount + element.amount;
        } else {
          expensesAmount = element.amount;
        }
      }
    }

    incomeAmount ??= 0;
    expensesAmount ??= 0;

    return (incomeAmount: incomeAmount, expensesAmount: expensesAmount);
  }

  void _addDeal(AddDealEvent event, Emitter<MainState> emit) {
    try {
      if (event.incomeDeal != null && event.expensesDeal != null) throw Exception();

      if (event.incomeDeal != null) {
        incomesDealBox.put(
          'key_${event.date}',
          IncomesDealDB(
            amount: event.amount,
            date: event.date.toUtc(),
            incomeType: IncomeDealType.toEntity(event.incomeDeal!),
          ),
        );
      }

      if (event.expensesDeal != null) {
        expensesDealBox.put(
          'key_${event.date}',
          ExpensesDealDB(
            amount: event.amount,
            date: event.date.toUtc(),
            incomeType: ExpensesDealType.toEntity(event.expensesDeal!),
          ),
        );
      }

      final List<Deal> finalDeals = _getDeals();

      final totalAmount = _getTotalAmount(finalDeals);

      emit(
        SuccessMainState(
          deals: finalDeals,
          incomeAmount: totalAmount.incomeAmount,
          expensesAmount: totalAmount.expensesAmount,
        ),
      );
    } on Exception catch (_) {
      emit(ErrorMainState());
    }
  }
}
