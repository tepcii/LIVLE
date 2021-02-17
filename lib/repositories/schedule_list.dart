import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:livle/repositories/schedule.dart';
import 'package:livle/source/interfaces/schedule.dart';
import 'package:livle/source/schedule.dart';

part 'schedule_list.freezed.dart';
part 'schedule_list.g.dart';

class ScheduleRepository extends ChangeNotifier {
  ScheduleRepository({
    @required this.source,
    @required ScheduleList scheduleList,
  }) : _scheduleList = scheduleList;

  IScheduleDataSource source;
  ScheduleList _scheduleList;

  ScheduleList get scheduleList => _scheduleList;
  set scheduleList(ScheduleList value) {
    _scheduleList = value;
    notifyListeners();
  }
}

@freezed
abstract class ScheduleList with _$ScheduleList {
  const factory ScheduleList({
    @SchedulesConverter() @Default(<Schedule>[]) List<Schedule> schedules,
  }) = _ScheduleList;

  factory ScheduleList.fromJson(Map<String, dynamic> json) => _$ScheduleListFromJson(json);
}

final Provider<ScheduleRepository> scheduleRepositoryProvider = Provider<ScheduleRepository>(
  (ProviderReference ref) => ScheduleRepository(
    source: ScheduleDataSource(),
    scheduleList: const ScheduleList(),
  ),
);

class SchedulesConverter implements JsonConverter<List<Schedule>, List<dynamic>> {
  const SchedulesConverter();

  @override
  List<Schedule> fromJson(List<dynamic> json) {
    if (json == null) {
      return null;
    }
    return json
        .map<Schedule>((dynamic e) => Schedule(
              id: e['id'] as String,
              title: e['title'] as String,
              date: e['date'] as Timestamp,
              memo: e['memo'] as String,
              artistId: e['artistId'] as String,
            ))
        .toList();
  }

  @override
  List<dynamic> toJson(List<Schedule> data) => data;
}
