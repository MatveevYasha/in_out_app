import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:in_out_app/src/shared/helpers/string_extension.dart';
import 'package:intl/intl.dart';

class TransactionMonthTitle extends StatelessWidget {
  final Deal deal;

  const TransactionMonthTitle({required this.deal, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        DateFormat.MMMMEEEEd('ru').format(deal.date).capitalize(),
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
