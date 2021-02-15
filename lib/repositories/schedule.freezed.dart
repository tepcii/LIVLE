// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ScheduleListTearOff {
  const _$ScheduleListTearOff();

// ignore: unused_element
  _ScheduleList call(
      {@required IScheduleDataSource source,
      List<Schedule> spendings = const <Schedule>[]}) {
    return _ScheduleList(
      source: source,
      spendings: spendings,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ScheduleList = _$ScheduleListTearOff();

/// @nodoc
mixin _$ScheduleList {
  IScheduleDataSource get source;
  List<Schedule> get spendings;

  $ScheduleListCopyWith<ScheduleList> get copyWith;
}

/// @nodoc
abstract class $ScheduleListCopyWith<$Res> {
  factory $ScheduleListCopyWith(
          ScheduleList value, $Res Function(ScheduleList) then) =
      _$ScheduleListCopyWithImpl<$Res>;
  $Res call({IScheduleDataSource source, List<Schedule> spendings});
}

/// @nodoc
class _$ScheduleListCopyWithImpl<$Res> implements $ScheduleListCopyWith<$Res> {
  _$ScheduleListCopyWithImpl(this._value, this._then);

  final ScheduleList _value;
  // ignore: unused_field
  final $Res Function(ScheduleList) _then;

  @override
  $Res call({
    Object source = freezed,
    Object spendings = freezed,
  }) {
    return _then(_value.copyWith(
      source: source == freezed ? _value.source : source as IScheduleDataSource,
      spendings:
          spendings == freezed ? _value.spendings : spendings as List<Schedule>,
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
  $Res call({IScheduleDataSource source, List<Schedule> spendings});
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
    Object source = freezed,
    Object spendings = freezed,
  }) {
    return _then(_ScheduleList(
      source: source == freezed ? _value.source : source as IScheduleDataSource,
      spendings:
          spendings == freezed ? _value.spendings : spendings as List<Schedule>,
    ));
  }
}

/// @nodoc
class _$_ScheduleList implements _ScheduleList {
  const _$_ScheduleList(
      {@required this.source, this.spendings = const <Schedule>[]})
      : assert(source != null),
        assert(spendings != null);

  @override
  final IScheduleDataSource source;
  @JsonKey(defaultValue: const <Schedule>[])
  @override
  final List<Schedule> spendings;

  @override
  String toString() {
    return 'ScheduleList(source: $source, spendings: $spendings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ScheduleList &&
            (identical(other.source, source) ||
                const DeepCollectionEquality().equals(other.source, source)) &&
            (identical(other.spendings, spendings) ||
                const DeepCollectionEquality()
                    .equals(other.spendings, spendings)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(source) ^
      const DeepCollectionEquality().hash(spendings);

  @override
  _$ScheduleListCopyWith<_ScheduleList> get copyWith =>
      __$ScheduleListCopyWithImpl<_ScheduleList>(this, _$identity);
}

abstract class _ScheduleList implements ScheduleList {
  const factory _ScheduleList(
      {@required IScheduleDataSource source,
      List<Schedule> spendings}) = _$_ScheduleList;

  @override
  IScheduleDataSource get source;
  @override
  List<Schedule> get spendings;
  @override
  _$ScheduleListCopyWith<_ScheduleList> get copyWith;
}
