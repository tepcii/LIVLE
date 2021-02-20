import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:livle/providers/artist_view_provider.dart';
import 'package:livle/providers/firestore_providers.dart';
import 'package:livle/repositories/artist_list.dart';
import 'package:livle/repositories/money_list.dart';
import 'package:livle/repositories/schedule_list.dart';
import 'package:livle/view/components/common/loading_indicator.dart';

class ArtistPage extends ConsumerWidget {
  const ArtistPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final ArtistViewModel _artistViewModel = watch(artistViewModelNotifierProvider);
    final AsyncValue<Map<String, dynamic>> _scheduleStreamProvider = watch(scheduleStreamProvider);
    final AsyncValue<Map<String, dynamic>> _artistsStreamProvider = watch(artistsStreamProvider);
    final AsyncValue<Map<String, dynamic>> _moneyStreamProvider = watch(moneyStreamProvider);
    return _scheduleStreamProvider.when(
      data: (Map<String, dynamic> data) {
        if (data != null) {
          _artistViewModel.scheduleRepository.scheduleList = ScheduleList.fromJson(data);
        }
        return _artistsStreamProvider.when(
          data: (Map<String, dynamic> data) {
            if (data != null) {
              _artistViewModel.artistRepository.artistList = ArtistList.fromJson(data);
            }
            return _moneyStreamProvider.when(
              data: (Map<String, dynamic> data) {
                if (data != null) {
                  _artistViewModel.moneyRepository.moneyList = MoneyList.fromJson(data);
                }
                return Container(
                  color: Colors.white,
                );
              },
              loading: () => const LoadingIndicator(),
              error: (_, __) => const LoadingIndicator(),
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
