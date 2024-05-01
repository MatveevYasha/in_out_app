import 'package:core/core.dart';

sealed class MainEvent {}

class InitialMainEvent extends MainEvent {}

class AddDealEvent extends MainEvent {
  final int amount;
  final DateTime date;
  final IncomeDealType? incomeDeal;
  final ExpensesDealType? expensesDeal;

  AddDealEvent({
    required this.amount,
    required this.date,
    required this.incomeDeal,
    required this.expensesDeal,
  });
}

class RemoveDealEvent extends MainEvent {
  final Deal deal;

  RemoveDealEvent({required this.deal});
}

class AddFilterEvent extends MainEvent {
  final DateTime? startDate;
  final DateTime? endDate;

  AddFilterEvent({
    required this.startDate,
    required this.endDate,
  });
}
