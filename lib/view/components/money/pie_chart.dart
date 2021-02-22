import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:livle/providers/view_model/money.dart';

// import 'indicator.dart';

class MoneyPieChart extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final MoneyViewModel moneyViewModel = watch(moneyViewModelNotifierProvider);
    return PieChart(
      PieChartData(
        pieTouchData: PieTouchData(touchCallback: moneyViewModel.pieChartTouchCallBack),
        borderData: FlBorderData(
          show: false,
        ),
        sectionsSpace: 0,
        centerSpaceRadius: 50,
        sections: moneyViewModel.showingSections(),
      ),
    );
  }
}
