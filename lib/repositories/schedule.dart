import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:livle/source/interfaces/schedule.dart';
import 'package:livle/source/schedule.dart';

part 'schedule.freezed.dart';

@freezed
abstract class ScheduleList with _$ScheduleList {
  const factory ScheduleList({
    @required IScheduleDataSource source,
    @Default(<Schedule>[]) List<Schedule> spendings,
  }) = _ScheduleList;
}

class Schedule {
  Schedule({this.title, this.date, this.memo});
  String title;
  Timestamp date;
  String memo;
}

final Provider<ScheduleList> scheduleListProvider = Provider<ScheduleList>(
  (ProviderReference ref) => ScheduleList(
    source: ScheduleDataSource(),
    spendings: <Schedule>[],
  ),
);
