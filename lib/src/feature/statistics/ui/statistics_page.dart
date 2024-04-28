import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Statistics Page',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}