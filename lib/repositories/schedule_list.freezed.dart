// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'schedule_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ScheduleList _$ScheduleListFromJson(Map<String, dynamic> json) {
  return _ScheduleList.fromJson(json);
}

/// @nodoc
class _$ScheduleListTearOff {
  const _$ScheduleListTearOff();

// ignore: unused_element
  _ScheduleList call(
      {@SchedulesConverter() List<Schedule> schedules = const <Schedule>[]}) {
    return _ScheduleList(
      schedules: schedules,
    );
  }

// ignore: unused_element
  ScheduleList fromJson(Map<String, Object> json) {
    return ScheduleList.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ScheduleList = _$ScheduleListTearOff();

/// @nodoc
mixin _$ScheduleList {
  @SchedulesConverter()
  List<Schedule> get schedules;

  Map<String, dynamic> toJson();
  $ScheduleListCopyWith<ScheduleList> get copyWith;
}

/// @nodoc
abstract class $ScheduleListCopyWith<$Res> {
  factory $ScheduleListCopyWith(
          ScheduleList value, $Res Function(ScheduleList) then) =
      _$ScheduleListCopyWithImpl<$Res>;
  $Res call({@SchedulesConverter() List<Schedule> schedules});
}

/// @nodoc
class _$ScheduleListCopyWithImpl<$Res> implements $ScheduleListCopyWith<$Res> {
  _$ScheduleListCopyWithImpl(this._value, this._then);

  final ScheduleList _value;
  // ignore: unused_field
  final $Res Function(ScheduleList) _then;

  @override
  $Res call({
    Object schedules = freezed,
  }) {
    return _then(_value.copyWith(
      schedules:
          schedules == freezed ? _value.schedules : schedules as List<Schedule>,
    ));
  }
}

/// @nodoc
abstract class _$ScheduleListCopyWith<$Res>
    implements $ScheduleListCopyWith<$Res> {
  factory _$ScheduleListCopyWith(
          _ScheduleList value, $Res Function(_ScheduleList) then) =
      __$ScheduleListCopyWithImpl<$Res>;
  @override
  $Res call({@SchedulesConverter() List<Schedule> schedules});
}

/// @nodoc
class __$ScheduleListCopyWithImpl<$Res> extends _$ScheduleListCopyWithImpl<$Res>
    implements _$ScheduleListCopyWith<$Res> {
  __$ScheduleListCopyWithImpl(
      _ScheduleList _value, $Res Function(_ScheduleList) _then)
      : super(_value, (v) => _then(v as _ScheduleList));

  @override
  _ScheduleList get _value => super._value as _ScheduleList;

  @override
  $Res call({
    Object schedules = freezed,
  }) {
    return _then(_ScheduleList(
      schedules:
          schedules == freezed ? _value.schedules : schedules as List<Schedule>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ScheduleList implements _ScheduleList {
  const _$_ScheduleList(
      {@SchedulesConverter() this.schedules = const <Schedule>[]})
      : assert(schedules != null);

  factory _$_ScheduleList.fromJson(Map<String, dynamic> json) =>
      _$_$_ScheduleListFromJson(json);

  @JsonKey(defaultValue: const <Schedule>[])
  @override
  @SchedulesConverter()
  final List<Schedule> schedules;

  @override
  String toString() {
    return 'ScheduleList(schedules: $schedules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ScheduleList &&
            (identical(other.schedules, schedules) ||
                const DeepCollectionEquality()
                    .equals(other.schedules, schedules)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(schedules);

  @override
  _$ScheduleListCopyWith<_ScheduleList> get copyWith =>
      __$ScheduleListCopyWithImpl<_ScheduleList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ScheduleListToJson(this);
  }
}

abstract class _ScheduleList implements ScheduleList {
  const factory _ScheduleList(
      {@SchedulesConverter() List<Schedule> schedules}) = _$_ScheduleList;

  factory _ScheduleList.fromJson(Map<String, dynamic> json) =
      _$_ScheduleList.fromJson;

  @override
  @SchedulesConverter()
  List<Schedule> get schedules;
  @override
  _$ScheduleListCopyWith<_ScheduleList> get copyWith;
}
