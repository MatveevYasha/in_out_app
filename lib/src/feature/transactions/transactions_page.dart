import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:in_out_app/src/feature/transactions/ui/widgets/empty_transactions_page.dart';
import 'package:in_out_app/src/feature/transactions/ui/widgets/transaction_card.dart';
import 'package:in_out_app/src/feature/transactions/ui/widgets/transaction_month_title.dart';

class TransactionsPage extends StatelessWidget {
  final List<Deal> deals;

  const TransactionsPage({required this.deals, super.key});

  @override
  Widget build(BuildContext context) {
    if (deals.isEmpty) return const EmptyTransactionsPage();

    return ListView.separated(
      itemBuilder: (context, index) {
        final deal = deals[index];

        final (textColor, arithmetic, title) = switch (deal) {
          IncomeDeal _ => (Colors.green, '+', IncomeDealType.toEntity(deal.incomeType)),
          ExpensesDeal _ => (Colors.red, '-', ExpensesDealType.toEntity(deal.incomeType)),
          _ => (Colors.grey, '', ''),
        };

        return Column(
          children: [
            if (index == 0 ||
                (deals[index].date.day != deals[index - 1].date.day ||
                    deals[index].date.month != deals[index - 1].date.month))
              TransactionMonthTitle(deal: deal),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TransactionCard(
                arithmetic: arithmetic,
                deal: deal,
                textColor: textColor,
                title: title,
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
