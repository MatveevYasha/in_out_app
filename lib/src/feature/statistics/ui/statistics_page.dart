import 'package:flutter/material.dart';
import 'package:in_out_app/src/feature/data/entities/deal.dart';
import 'package:in_out_app/src/feature/data/entities/expenses.dart';
import 'package:in_out_app/src/feature/data/entities/income.dart';
import 'package:in_out_app/src/feature/data/handbooks/expenses_deal_type.dart';
import 'package:in_out_app/src/feature/data/handbooks/income_deal_type.dart';
import 'package:pie_chart/pie_chart.dart';

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

    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Доходы по категориям:',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          PieChart(
            dataMap: incomeDealsMap,
            chartRadius: MediaQuery.sizeOf(context).height * 0.25,
          ),
          const Text(
            'Доходы всего:',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          DecoratedBox(
            decoration: const BoxDecoration(color: Colors.green),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * incomeAmountWidth,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  '$incomeAmount',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const Spacer(),
          const Text(
            'Расходы по категориям:',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          PieChart(
            dataMap: expensesDealsMap,
            chartRadius: MediaQuery.sizeOf(context).height * 0.25,
          ),
          const Text(
            'Расходы всего:',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          DecoratedBox(
            decoration: const BoxDecoration(color: Colors.green),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * expensesAmountWidth,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  '$expensesAmount',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
