import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieStatistics extends StatelessWidget {
  final String title;
  final Map<String, double> dealsMap;

  const PieStatistics({
    required this.title,
    required this.dealsMap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (dealsMap.isEmpty) {
      return Expanded(
        child: Center(
          child: Text(
            'Статистика по $titleам не доступна',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, color: Colors.grey),
          ),
        ),
      );
    }

    return PieChart(
      dataMap: dealsMap,
      chartRadius: MediaQuery.sizeOf(context).height * 0.2,
    );
  }
}
