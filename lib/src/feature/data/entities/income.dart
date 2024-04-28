import 'package:in_out_app/src/feature/data/entities/deal.dart';
import 'package:in_out_app/src/feature/data/handbooks/income_deal_type.dart';

class IncomeDeal extends Deal {
  final IncomeDealType incomeType;

  IncomeDeal({
    required super.amount,
    required super.date,
    required this.incomeType,
  });
}
