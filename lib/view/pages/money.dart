import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livle/providers/firestore_providers.dart';
import 'package:livle/providers/view_model/money.dart';
import 'package:livle/repositories/artist_list.dart';
import 'package:livle/repositories/money_list.dart';
import 'package:livle/view/components/common/loading_indicator.dart';
import 'package:livle/view/components/money/money_tab_bar.dart';

class MoneyPage extends HookConsumerWidget {
  final Color barColor = Colors.white;
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final double width = 22;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MoneyViewModel _moneyViewModel = ref.watch(moneyViewModelNotifierProvider);
    final AsyncValue<Map<String, dynamic>?> _moneyStreamProvider = ref.watch(moneyStreamProvider);
    final AsyncValue<Map<String, dynamic>?> _artistsStreamProvider = ref.watch(artistsStreamProvider);
    return _moneyStreamProvider.when(
      data: (Map<String, dynamic>? data) {
        _moneyViewModel.moneyRepository.moneyList = MoneyList.fromJson(data ?? <String, dynamic>{});
        return _artistsStreamProvider.when(
          data: (Map<String, dynamic>? data) {
            _moneyViewModel.artistRepository.artistList = ArtistList.fromJson(data ?? <String, dynamic>{});
            if (_moneyViewModel.moneyRepository.moneyList.spendings.isNotEmpty) {
              return const MoneyTabBarView();
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
