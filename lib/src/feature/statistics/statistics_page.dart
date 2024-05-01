import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:in_out_app/src/feature/statistics/widgets/linear_statistics.dart';
import 'package:in_out_app/src/feature/statistics/widgets/pie_statistics.dart';
import 'package:in_out_app/src/feature/statistics/widgets/statistics_error_empty.dart';

class StatisticsPage extends StatelessWidget {
  final List<Deal> deals;
  final int incomeAmount;
  final int expensesAmount;

  const StatisticsPage({
    required this.deals,
    required this.incomeAmount,
    required this.expensesAmount,
    super.key,
  });

  void _addElementsToMap(Map<String, double> incomeDealsMap, Map<String, double> expensesDealsMap) {
    for (final element in deals) {
      final (title, amount) = switch (element) {
        IncomeDeal _ => (IncomeDealType.toEntity(element.incomeType), element.amount.toDouble()),
        ExpensesDeal _ => (ExpensesDealType.toEntity(element.incomeType), element.amount.toDouble()),
        _ => ('', 0.0),
      };

      if (element.runtimeType == IncomeDeal) {
        if (incomeDealsMap.containsKey(title)) {
          incomeDealsMap[title] = amount + incomeDealsMap[title]!;
        } else {
          incomeDealsMap[title] = amount;
        }
      }

      if (element.runtimeType == ExpensesDeal) {
        if (expensesDealsMap.containsKey(title)) {
          expensesDealsMap[title] = amount + expensesDealsMap[title]!;
        } else {
          expensesDealsMap[title] = amount;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, double> incomeDealsMap = {};
    final Map<String, double> expensesDealsMap = {};

    _addElementsToMap(incomeDealsMap, expensesDealsMap);

    double incomeAmountWidth;
    double expensesAmountWidth;

    if (incomeAmount > expensesAmount) {
      incomeAmountWidth = 1;
      expensesAmountWidth = expensesAmount / incomeAmount;
    } else {
      expensesAmountWidth = 1;
      incomeAmountWidth = incomeAmount / expensesAmount;
    }

    if (deals.isEmpty) return const StatisticsErrorEmpty();

    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (incomeDealsMap.isNotEmpty) ...[
              const Text(
                'Доходы по категориям:',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              PieStatistics(
                title: 'доход',
                dealsMap: incomeDealsMap,
              ),
              LinearStatistics(
                title: 'Доходы',
                amountWidth: incomeAmountWidth,
                amount: incomeAmount,
              ),
              const SizedBox(height: 18),
            ],
            if (expensesDealsMap.isNotEmpty) ...[
              const Text(
                'Расходы по категориям:',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              PieStatistics(
                title: 'расход',
                dealsMap: expensesDealsMap,
              ),
              LinearStatistics(
                title: 'Расходы',
                amountWidth: expensesAmountWidth,
                amount: expensesAmount,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
