import 'package:core/core.dart';

abstract interface class DBRepository {
  Stream<ExpensesDeal> getExpensesDeals();

  Future<void> saveExpensesDeal(ExpensesDeal item);
}
