import 'package:in_out_app/src/feature/data/entities/deal.dart';
import 'package:in_out_app/src/feature/data/handbooks/expenses_deal_type.dart';

class ExpensesDeal extends Deal {
  final ExpensesDealType incomeType;

  ExpensesDeal({
    required super.amount,
    required super.date,
    required this.incomeType,
  });
}
