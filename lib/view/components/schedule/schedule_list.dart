import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livle/providers/view_model/schedule.dart';
import 'package:livle/repositories/schedule.dart';
import 'package:livle/view/components/schedule/schedule_list_tile.dart';

class ScheduleListView extends HookConsumerWidget {
  const ScheduleListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScheduleViewModel _scheduleViewModel = ref.watch(scheduleViewModelNotifierProvider);
    final List<Schedule> _scheduleList = _scheduleViewModel.scheduleRepository.scheduleList.schedules;
    return ListView.builder(
      itemCount: _scheduleList.length,
      itemBuilder: (BuildContext context, int index) {
        final Schedule _schedule = _scheduleList[index];
        return ScheduleListTile(
          schedule: _schedule,
        );
      },
    );
  }
}
