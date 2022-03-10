import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:livle/providers/view_model/money.dart';
import 'package:livle/view/components/money/money_list.dart';
import 'package:livle/view/components/money/pie_chart.dart';

class MoneyGraphView extends ConsumerWidget {
  const MoneyGraphView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final MoneyViewModel _moneyViewModel = watch(moneyViewModelNotifierProvider);
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: <Widget>[
                MoneyPieChart(),
                Text('合計金額：${_moneyViewModel.totalAmount().toString()}円'),
                const SizedBox(
                  height: 12,
                ),
                const Expanded(
                  child: MoneyListView(),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 20,
          bottom: 20,
          child: FloatingActionButton(
            backgroundColor: Colors.orange,
            child: const Icon(FontAwesomeIcons.plus),
            onPressed: () => Navigator.pushNamed(context, '/register_money'),
          ),
        ),
      ],
    );
  }
}
