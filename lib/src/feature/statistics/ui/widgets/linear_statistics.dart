import 'package:flutter/material.dart';

class LinearStatistics extends StatelessWidget {
  final String title;
  final double amountWidth;
  final int amount;

  const LinearStatistics({
    required this.title,
    required this.amountWidth,
    required this.amount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title всего:',
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.green[300]),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * amountWidth,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                '$amount',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
