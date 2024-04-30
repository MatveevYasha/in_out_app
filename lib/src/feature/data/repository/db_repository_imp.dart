import 'package:core/core.dart';

class DBRepositoryImpl implements DBRepository {
  final DBDataProvider _provider;

  const DBRepositoryImpl({required DBDataProvider provider}) : _provider = provider;

  @override
  Stream<ExpensesDeal> getExpensesDeals() => _provider.getExpensesDeals();

  @override
  Future<void> saveExpensesDeal(ExpensesDeal item) => _provider.saveExpensesDeal(item);
}
