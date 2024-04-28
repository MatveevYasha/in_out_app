import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_out_app/src/feature/data/entities/expenses.dart';

import 'package:in_out_app/src/feature/data/entities/income.dart';
import 'package:in_out_app/src/feature/home/bloc/main_event.dart';
import 'package:in_out_app/src/feature/home/bloc/main_state.dart';

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

      final deals = [
        IncomeDeal(amount: 400, date: DateTime.now(), incomeType: IncomeDealType.salary),
        IncomeDeal(amount: 500, date: DateTime.now(), incomeType: IncomeDealType.salary),
        IncomeDeal(amount: 600, date: DateTime.now(), incomeType: IncomeDealType.salary),
        ExpensesDeal(amount: 100, date: DateTime.now(), incomeType: ExpensesDealType.cafe),
        ExpensesDeal(amount: 200, date: DateTime.now(), incomeType: ExpensesDealType.entertainments),
        ExpensesDeal(amount: 300, date: DateTime.now(), incomeType: ExpensesDealType.supermarkets),
      ];

      emit(SuccessMainState(deals: deals));
    } on Exception catch (_) {
      emit(ErrorMainState());
    }
  }

  void _addDeal(AddDeal event, Emitter<MainState> emit) {}
}
