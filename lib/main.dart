import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:in_out_app/runner.dart';
import 'package:in_out_app/src/feature/data/database/expenses_deal_db.dart';
import 'package:in_out_app/src/feature/data/database/incomes_deal_db.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting('ru');
  await Hive.initFlutter();
  Hive.registerAdapter(ExpensesDealDBAdapter());
  Hive.registerAdapter(IncomesDealDBAdapter());
  final expensesDealBox = await Hive.openBox<ExpensesDealDB>('ExpensesDealBox');
  final incomesDealBox = await Hive.openBox<IncomesDealDB>('IncomesDealBox');

  runApp(
    InOutApp(
      expensesDealBox: expensesDealBox,
      incomesDealBox: incomesDealBox,
    ),
  );
}
