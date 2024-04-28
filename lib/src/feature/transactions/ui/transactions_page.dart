import 'package:flutter/material.dart';
import 'package:in_out_app/src/feature/data/entities/deal.dart';
import 'package:in_out_app/src/feature/data/entities/expenses.dart';
import 'package:in_out_app/src/feature/data/entities/income.dart';
import 'package:in_out_app/src/feature/data/handbooks/expenses_deal_type.dart';
import 'package:in_out_app/src/feature/data/handbooks/income_deal_type.dart';
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

        final (textColor, arithmetic, title) = switch (deal) {
          IncomeDeal _ => (Colors.green, '+', IncomeDealType.toEntity()),
          ExpensesDeal _ => (Colors.red, '-', ExpensesDealType.toEntity()),
          _ => (Colors.grey, '', ''),
        };

        return Column(
          children: [
            if (index == 0 ||
                (deals[index].date.day != deals[index - 1].date.day ||
                    deals[index].date.month != deals[index - 1].date.month))
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  DateFormat.MMMMEEEEd('ru').format(deal.date).capitalize(),
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '$arithmetic ${deal.amount}',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      DateFormat.Hm().format(deal.date),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        if (deals[index].date.day == deals[index + 1].date.day &&
            deals[index].date.month == deals[index + 1].date.month) {
          return const Divider();
        }

        return const SizedBox.shrink();
      },
      itemCount: deals.length,
    );
  }
}
