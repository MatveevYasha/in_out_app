import 'package:hive/hive.dart';

part 'incomes_deal_db.g.dart';

@HiveType(typeId: 2)
class IncomesDealDB {
  IncomesDealDB({
    required this.amount,
    required this.date,
    required this.incomeType,
  });

  @HiveField(0)
  int amount;

  @HiveField(1)
  DateTime date;

  @HiveField(2)
  String incomeType;
}
