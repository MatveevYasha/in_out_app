import 'package:flutter/material.dart';
import 'package:in_out_app/src/feature/data/entities/deal.dart';
import 'package:in_out_app/src/feature/data/entities/expenses.dart';
import 'package:in_out_app/src/feature/data/entities/income.dart';
import 'package:in_out_app/src/shared/helpers/string_extension.dart';
import 'package:intl/intl.dart';

class TransactionsPage extends StatelessWidget {
  final List<Deal> deals;

  const TransactionsPage({required this.deals, super.key});

  @override
  Widget build(BuildContext context) {
    if (deals.isEmpty) {
      return const Center(
        child: Text(
          'Список транзакций пуст, необходимо добавить покупку или доход на передыдущем экране.',
          style: TextStyle(fontSize: 21),
          textAlign: TextAlign.center,
        ),
      );
    }

    return ListView.separated(
      itemBuilder: (context, index) {
        final deal = deals[index];

        final (textColor, arithmetic) = switch (deal) {
          IncomeDeal _ => (Colors.green, '+'),
          ExpensesDeal _ => (Colors.red, '-'),
          _ => (Colors.grey, ''),
        };

        return Column(
          children: [
            if (index == 0 ||
                (deals[index].date.day != deals[index - 1].date.day ||
                    deals[index].date.month != deals[index - 1].date.month))
              Text(
                DateFormat.MMMMEEEEd('ru').format(deal.date).capitalize(),
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '$arithmetic ${deal.amount}',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 24,
                  ),
                ),
                Text(
                  DateFormat.Hm().format(deal.date),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: deals.length,
    );
  }
}
