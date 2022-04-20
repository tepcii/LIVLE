import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livle/providers/view_model/money.dart';

// import 'indicator.dart';

class MoneyPieChart extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MoneyViewModel moneyViewModel = ref.watch(moneyViewModelNotifierProvider);
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
