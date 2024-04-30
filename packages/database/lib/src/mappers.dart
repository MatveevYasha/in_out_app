import 'package:core/core.dart';
import 'package:database/src/database.dart';
import 'package:drift/drift.dart';

import '../../database.dart';

extension DBExpensesDealMapper on DBExpensesDeal {
  ExpensesDeal toEntity() {
    return ExpensesDeal(
      amount: Value(amount),
      date: date,
      incomeType: incomeType,
    );
  }
}
