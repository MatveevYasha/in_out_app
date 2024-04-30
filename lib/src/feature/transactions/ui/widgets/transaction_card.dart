import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final String arithmetic;
  final Deal deal;
  final MaterialColor textColor;
  final String title;

  const TransactionCard({
    required this.arithmetic,
    required this.deal,
    required this.textColor,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            DateFormat.Hm().format(deal.date.toLocal()),
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 24,
            ),
          ),
        ),
      ],
    );
  }
}
