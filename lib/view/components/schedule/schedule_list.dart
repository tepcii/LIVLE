import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:livle/providers/schedule_view_provider.dart';
import 'package:livle/repositories/schedule.dart';
import 'package:livle/view/components/schedule/schedule_list_tile.dart';

class ScheduleListView extends ConsumerWidget {
  const ScheduleListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final ScheduleViewModel _scheduleViewModel = watch(scheduleViewModelNotifierProvider);
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
