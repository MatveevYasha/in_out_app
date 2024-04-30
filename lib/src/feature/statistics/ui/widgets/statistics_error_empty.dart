import 'package:flutter/material.dart';

class StatisticsErrorEmpty extends StatelessWidget {
  const StatisticsErrorEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          'Список транзакций пуст, статистика пока не доступна',
          style: TextStyle(fontSize: 21),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
