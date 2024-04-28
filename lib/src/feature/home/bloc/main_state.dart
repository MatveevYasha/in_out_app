import 'package:in_out_app/src/feature/data/entities/deal.dart';

sealed class MainState {}

class LoadingMainState extends MainState {
  LoadingMainState();
}

class SuccessMainState extends MainState {
  final List<Deal> deals;
  final int? incomeAmount;
  final int? expensesAmount;

  SuccessMainState({required this.deals, this.incomeAmount, this.expensesAmount});
}

class ErrorMainState extends MainState {
  ErrorMainState();
}
