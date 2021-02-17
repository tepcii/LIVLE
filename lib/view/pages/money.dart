import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:livle/providers/firestore_providers.dart';
import 'package:livle/providers/money_view_provider.dart';
import 'package:livle/repositories/artist_list.dart';
import 'package:livle/repositories/money_list.dart';
import 'package:livle/view/components/common/loading_indicator.dart';

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
        _moneyViewModel.moneyRepository.moneyList = MoneyList.fromJson(data);
        return _artistsStreamProvider.when(
          data: (Map<String, dynamic> data) {
            _moneyViewModel.artistRepository.artistList = ArtistList.fromJson(data);
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
      },
      loading: () => const LoadingIndicator(),
      error: (_, __) => const LoadingIndicator(),
    );
  }
}
