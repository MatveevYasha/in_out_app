import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:in_out_app/src/feature/transactions/widgets/remove_dialog.dart';
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
          flex: 2,
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
        Text(
          DateFormat.Hm().format(deal.date.toLocal()),
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 24,
          ),
        ),
        IconButton(
          onPressed: () => _removeDialog(context, deal: deal),
          icon: const Icon(
            Icons.remove_circle_outline_rounded,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  Future<void> _removeDialog(BuildContext context, {required Deal deal}) {
    return showDialog<void>(
      context: context,
      builder: (context) => RemoveDialog(deal: deal),
    );
  }
}
