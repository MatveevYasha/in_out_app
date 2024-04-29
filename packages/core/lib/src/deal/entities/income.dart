import 'package:core/src/deal/entities/deal.dart';
import 'package:core/src/deal/handbooks/income_deal_type.dart';

class IncomeDeal extends Deal {
  final IncomeDealType incomeType;

  IncomeDeal({
    required super.amount,
    required super.date,
    required this.incomeType,
  });
}
