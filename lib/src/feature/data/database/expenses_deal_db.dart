import 'package:hive/hive.dart';

part 'expenses_deal_db.g.dart';

@HiveType(typeId: 1)
class ExpensesDealDB {
  ExpensesDealDB({
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
