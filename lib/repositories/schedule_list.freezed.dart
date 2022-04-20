// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schedule_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScheduleList _$ScheduleListFromJson(Map<String, dynamic> json) {
  return _ScheduleList.fromJson(json);
}

/// @nodoc
mixin _$ScheduleList {
  @SchedulesConverter()
  List<Schedule> get schedules => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleListCopyWith<ScheduleList> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? schedules = freezed,
  }) {
    return _then(_value.copyWith(
      schedules: schedules == freezed
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<Schedule>,
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
    Object? schedules = freezed,
  }) {
    return _then(_ScheduleList(
      schedules: schedules == freezed
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<Schedule>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ScheduleList implements _ScheduleList {
  const _$_ScheduleList(
      {@SchedulesConverter()
          final List<Schedule> schedules = const <Schedule>[]})
      : _schedules = schedules;

  factory _$_ScheduleList.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleListFromJson(json);

  @SchedulesConverter()
  final List<Schedule> _schedules;
  @override
  @JsonKey()
  @SchedulesConverter()
  List<Schedule> get schedules {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedules);
  }

  @override
  String toString() {
    return 'ScheduleList(schedules: $schedules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleList &&
            const DeepCollectionEquality().equals(other.schedules, schedules));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(schedules));

  @JsonKey(ignore: true)
  @override
  _$ScheduleListCopyWith<_ScheduleList> get copyWith =>
      __$ScheduleListCopyWithImpl<_ScheduleList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleListToJson(this);
  }
}

abstract class _ScheduleList implements ScheduleList {
  const factory _ScheduleList(
      {@SchedulesConverter() final List<Schedule> schedules}) = _$_ScheduleList;

  factory _ScheduleList.fromJson(Map<String, dynamic> json) =
      _$_ScheduleList.fromJson;

  @override
  @SchedulesConverter()
  List<Schedule> get schedules => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ScheduleListCopyWith<_ScheduleList> get copyWith =>
      throw _privateConstructorUsedError;
}
