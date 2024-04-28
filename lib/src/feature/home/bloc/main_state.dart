import 'package:in_out_app/src/feature/data/entities/deal.dart';

sealed class MainState {}

class LoadingMainState extends MainState {
  LoadingMainState();
}

class SuccessMainState extends MainState {
  final List<Deal> deals;
  final int incomeAmount;
  final int expensesAmount;

  SuccessMainState({required this.deals, this.incomeAmount = 0, this.expensesAmount = 0});
}

class ErrorMainState extends MainState {
  ErrorMainState();
}
