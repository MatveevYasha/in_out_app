import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_out_app/src/feature/data/entities/expenses.dart';

import 'package:in_out_app/src/feature/data/entities/income.dart';
import 'package:in_out_app/src/feature/home/bloc/main_event.dart';
import 'package:in_out_app/src/feature/home/bloc/main_state.dart';

final _mockDeals = [
  IncomeDeal(amount: 400, date: DateTime.utc(2024, 11, 9, 9, 20), incomeType: IncomeDealType.salary),
  IncomeDeal(amount: 500, date: DateTime.utc(2024, 12, 9, 9, 21), incomeType: IncomeDealType.salary),
  IncomeDeal(amount: 600, date: DateTime.utc(2024, 12, 10, 9, 22), incomeType: IncomeDealType.salary),
  ExpensesDeal(amount: 100, date: DateTime.utc(2024, 12, 10, 9, 23), incomeType: ExpensesDealType.cafe),
  ExpensesDeal(amount: 200, date: DateTime.utc(2024, 12, 10, 9, 24), incomeType: ExpensesDealType.entertainments),
  ExpensesDeal(amount: 300, date: DateTime.utc(2023, 12, 8, 9, 25), incomeType: ExpensesDealType.supermarkets),
];

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(LoadingMainState()) {
    on<MainEvent>(
      (event, emit) => switch (event) {
        final InitialMainEvent event => _initial(event, emit),
        final AddDeal event => _addDeal(event, emit),
      },
    );
  }

  Future<void> _initial(InitialMainEvent event, Emitter<MainState> emit) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 1));

// TODO: utc

      _mockDeals.sort((a, b) => b.date.compareTo(a.date));

      final deals = _mockDeals.where((item) => item.date.year >= DateTime.now().year).toList();

      final incomeAmount =
          deals.whereType<IncomeDeal>().map((e) => e.amount).toList().reduce((value, element) => value + element);

      final expensesAmount =
          deals.whereType<ExpensesDeal>().map((e) => e.amount).toList().reduce((value, element) => value + element);

      emit(
        SuccessMainState(
          deals: deals,
          incomeAmount: incomeAmount,
          expensesAmount: expensesAmount,
        ),
      );
    } on Exception catch (_) {
      emit(ErrorMainState());
    }
  }

  void _addDeal(AddDeal event, Emitter<MainState> emit) {}
}
