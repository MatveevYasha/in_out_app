import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:in_out_app/src/feature/home/widgets/add_deals_card.dart';

class HomePage extends StatefulWidget {
  final List<Deal> deals;
  final int incomeAmount;
  final int expensesAmount;

  const HomePage({
    required this.deals,
    required this.incomeAmount,
    required this.expensesAmount,
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int amount;
  late DateTime date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: AddDealsCard(
            amount: widget.incomeAmount,
            color: Colors.green[300],
            title: 'Доходы',
          ),
        ),
        Expanded(
          child: AddDealsCard(
            amount: widget.expensesAmount,
            color: Colors.red[400],
            title: 'Расходы',
          ),
        ),
      ],
    );
  }
}
