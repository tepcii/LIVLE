import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livle/providers/firestore_providers.dart';
import 'package:livle/providers/schedule_view_provider.dart';
import 'package:livle/repositories/artist_list.dart';
import 'package:livle/repositories/schedule_list.dart';
import 'package:livle/view/components/common/loading_indicator.dart';
import 'package:livle/view/components/schedule/schedule_list.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final ScheduleViewModel _scheduleViewModel = watch(scheduleViewModelNotifierProvider);
    final AsyncValue<Map<String, dynamic>> _scheduleStreamProvider = watch(scheduleStreamProvider);
    final AsyncValue<Map<String, dynamic>> _artistsStreamProvider = watch(artistsStreamProvider);
    return _scheduleStreamProvider.when(
      data: (Map<String, dynamic> data) {
        _scheduleViewModel.scheduleRepository.scheduleList = ScheduleList.fromJson(data);
        return _artistsStreamProvider.when(
          data: (Map<String, dynamic> data) {
            _scheduleViewModel.artistRepository.artistList = ArtistList.fromJson(data);
            return Container(color: Colors.white, child: const ScheduleListView());
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
