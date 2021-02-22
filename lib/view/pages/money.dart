import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:livle/providers/firestore_providers.dart';
import 'package:livle/providers/view_model/money.dart';
import 'package:livle/repositories/artist_list.dart';
import 'package:livle/repositories/money_list.dart';
import 'package:livle/view/components/common/loading_indicator.dart';
import 'package:livle/view/components/money/money_list.dart';

import '../components/money/pie_chart.dart';

class MoneyPage extends ConsumerWidget {
  final Color barColor = Colors.white;
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final double width = 22;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final MoneyViewModel _moneyViewModel = watch(moneyViewModelNotifierProvider);
    final AsyncValue<Map<String, dynamic>> _moneyStreamProvider = watch(moneyStreamProvider);
    final AsyncValue<Map<String, dynamic>> _artistsStreamProvider = watch(artistsStreamProvider);
    return _moneyStreamProvider.when(
      data: (Map<String, dynamic> data) {
        if (data != null) {
          _moneyViewModel.moneyRepository.moneyList = MoneyList.fromJson(data);
        }
        return _artistsStreamProvider.when(
          data: (Map<String, dynamic> data) {
            if (data != null) {
              _moneyViewModel.artistRepository.artistList = ArtistList.fromJson(data);
            }
            if (_moneyViewModel.moneyRepository.moneyList.spendings.isNotEmpty) {
              return Container(
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
              );
            } else {
              return Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('データが登録されていません。'),
                      RaisedButton.icon(
                        shape: const StadiumBorder(),
                        color: Colors.orange,
                        onPressed: () => Navigator.pushNamed(context, '/register_money'),
                        icon: const Icon(FontAwesomeIcons.plus),
                        label: const Text('登録する'),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
          loading: () => const LoadingIndicator(),
          error: (_, __) => const LoadingIndicator(),
        );
      },
      loading: () => const LoadingIndicator(),
      error: (_, __) => const LoadingIndicator(),
    );
  }
}
