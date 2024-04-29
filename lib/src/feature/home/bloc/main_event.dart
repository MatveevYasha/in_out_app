import 'package:in_out_app/src/feature/data/entities/deal.dart';
import 'package:in_out_app/src/feature/data/entities/expenses.dart';
import 'package:in_out_app/src/feature/data/handbooks/income_deal_type.dart';

sealed class MainEvent {}

class InitialMainEvent extends MainEvent {}

class AddDealEvent extends MainEvent {
  final int amount;
  final DateTime date;
  final IncomeDealType? incomeDeal;
  final ExpensesDeal? expensesDeal;

  AddDealEvent({
    required this.amount,
    required this.date,
    required this.incomeDeal,
    required this.expensesDeal,
  });
}
