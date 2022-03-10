import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:livle/providers/firestore_providers.dart';
import 'package:livle/providers/view_model/money.dart';
import 'package:livle/repositories/artist_list.dart';
import 'package:livle/repositories/money_list.dart';
import 'package:livle/view/components/common/loading_indicator.dart';
import 'package:livle/view/components/money/money_list.dart';
import 'package:livle/view/components/money/money_tab_bar.dart';

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
              return MoneyTabBarView();
            } else {
              return Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('データが登録されていません。'),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          shape: const StadiumBorder(),
                        ),
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
