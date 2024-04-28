import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Transactions Page',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}