// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScheduleList _$$_ScheduleListFromJson(Map<String, dynamic> json) =>
    _$_ScheduleList(
      schedules: json['schedules'] == null
          ? const <Schedule>[]
          : const SchedulesConverter().fromJson(json['schedules'] as List),
    );

Map<String, dynamic> _$$_ScheduleListToJson(_$_ScheduleList instance) =>
    <String, dynamic>{
      'schedules': const SchedulesConverter().toJson(instance.schedules),
    };
