import 'package:core/src/deal/entities/deal.dart';
import 'package:core/src/deal/handbooks/expenses_deal_type.dart';

class ExpensesDeal extends Deal {
  final ExpensesDealType incomeType;

  ExpensesDeal({
    required super.amount,
    required super.date,
    required this.incomeType,
  });
}
