// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScheduleList _$_$_ScheduleListFromJson(Map<String, dynamic> json) {
  return _$_ScheduleList(
    schedules:
        const SchedulesConverter().fromJson(json['schedules'] as List) ?? [],
  );
}

Map<String, dynamic> _$_$_ScheduleListToJson(_$_ScheduleList instance) =>
    <String, dynamic>{
      'schedules': const SchedulesConverter().toJson(instance.schedules),
    };
