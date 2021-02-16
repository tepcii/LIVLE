import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:livle/providers/firestore_providers.dart';
import 'package:livle/providers/money_view_provider.dart';
import 'package:livle/repositories/money_list.dart';
import 'package:livle/view/common_parts/loading_indicator.dart';

import '../pie_chart/pie_chart.dart';

class MoneyPage extends ConsumerWidget {
  final Color barColor = Colors.white;
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final double width = 22;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final MoneyViewModel _moneyViewModel = watch(moneyViewModelNotifierProvider);
    final AsyncValue<Map<String, dynamic>> _moneyStreamProvider = watch(moneyStreamProvider);
    return _moneyStreamProvider.when(
      data: (Map<String, dynamic> data) {
        _moneyViewModel.moneyRepository.moneyList = MoneyList.fromJson(data);
        return Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: <Widget>[
                MoneyPieChart(),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const LoadingIndicator(),
      error: (_, __) => const LoadingIndicator(),
    );
    // return FutureBuilder<bool>(
    //   future: moneyViewModel.fetch(),
    //   builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
    //     if (snapshot.hasData) {
    //       final MoneyList data = moneyViewModel.moneyRepository.moneyList;
    //       print(data);
    //       return Container(
    //         color: Colors.white,
    //         child: Padding(
    //           padding: const EdgeInsets.all(14.0),
    //           child: Column(
    //             children: <Widget>[
    //               MoneyPieChart(),
    //               const SizedBox(
    //                 height: 12,
    //               ),
    //             ],
    //           ),
    //         ),
    //       );
    //     } else {
    //       return const LoadingIndicator();
    //     }
    //   },
    // );
  }
}
