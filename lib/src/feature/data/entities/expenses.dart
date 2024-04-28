import 'package:in_out_app/src/feature/data/entities/deal.dart';

enum ExpensesDealType { supermarkets, home, taxi, cafe, entertainments, pharmacy }

class ExpensesDeal extends Deal {
  final ExpensesDealType incomeType;

  ExpensesDeal({
    required super.amount,
    required super.date,
    required this.incomeType,
  });
}
