import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:in_out_app/src/feature/bloc/main_event.dart';
import 'package:in_out_app/src/feature/bloc/main_state.dart';
import 'package:in_out_app/src/feature/data/database/expenses_deal_db.dart';
import 'package:in_out_app/src/feature/data/database/incomes_deal_db.dart';

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
        final RemoveDealEvent event => _removeDeal(event, emit),
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
          'key_${event.date.toUtc().microsecondsSinceEpoch}',
          IncomesDealDB(
            amount: event.amount,
            date: event.date.toUtc(),
            incomeType: IncomeDealType.toEntity(event.incomeDeal!),
          ),
        );
      }

      if (event.expensesDeal != null) {
        expensesDealBox.put(
          'key_${event.date.toUtc().microsecondsSinceEpoch}',
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

  void _removeDeal(RemoveDealEvent event, Emitter<MainState> emit) {
    try {
      if (event.deal.runtimeType == IncomeDeal) {
        incomesDealBox.delete('key_${event.deal.date.toUtc().microsecondsSinceEpoch}');
      }

      if (event.deal.runtimeType == ExpensesDeal) {
        expensesDealBox.delete('key_${event.deal.date.toUtc().microsecondsSinceEpoch}');
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
