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
