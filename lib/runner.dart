import 'package:flutter/material.dart';
import 'package:in_out_app/src/feature/home/ui/home_page.dart';
import 'package:in_out_app/src/feature/statistics/ui/statistics_page.dart';
import 'package:in_out_app/src/feature/transactions/ui/transactions_page.dart';
import 'package:in_out_app/src/shared/bottom_nav_bar/bottom_nav_bar.dart';

class InOutApp extends StatelessWidget {
  const InOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BottomNavBar(child: [
        HomePage(),
        TransactionsPage(),
        StatisticsPage(),
      ]),
    );
  }
}
