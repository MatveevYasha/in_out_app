import 'package:in_out_app/src/feature/data/entities/deal.dart';

enum IncomeDealType { salary, other }

class IncomeDeal extends Deal {
  final IncomeDealType incomeType;

  IncomeDeal({
    required super.amount,
    required super.date,
    required this.incomeType,
  });
}
