import 'package:core/core.dart';

abstract interface class DBDataProvider {
  Stream<ExpensesDeal> getExpensesDeals();

  Future<void> saveExpensesDeal(ExpensesDeal item);
}
