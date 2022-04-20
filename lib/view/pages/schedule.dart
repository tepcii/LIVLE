import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livle/providers/firestore_providers.dart';
import 'package:livle/providers/view_model/schedule.dart';
import 'package:livle/repositories/artist_list.dart';
import 'package:livle/repositories/schedule_list.dart';
import 'package:livle/view/components/common/loading_indicator.dart';
import 'package:livle/view/components/schedule/schedule_list.dart';

class SchedulePage extends HookConsumerWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScheduleViewModel _scheduleViewModel = ref.watch(scheduleViewModelNotifierProvider);
    final AsyncValue<Map<String, dynamic>?> _scheduleStreamProvider = ref.watch(scheduleStreamProvider);
    final AsyncValue<Map<String, dynamic>?> _artistsStreamProvider = ref.watch(artistsStreamProvider);
    return _scheduleStreamProvider.when(
      data: (Map<String, dynamic>? data) {
        _scheduleViewModel.scheduleRepository.scheduleList = ScheduleList.fromJson(data ?? <String, dynamic>{});
        return _artistsStreamProvider.when(
          data: (Map<String, dynamic>? data) {
            _scheduleViewModel.artistRepository.artistList = ArtistList.fromJson(data ?? <String, dynamic>{});
            if (_scheduleViewModel.scheduleRepository.scheduleList.schedules.isNotEmpty) {
              return Container(color: Colors.white, child: const ScheduleListView());
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
                        onPressed: () => print('登録画面'),
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
