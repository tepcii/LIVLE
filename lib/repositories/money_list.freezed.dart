// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'money_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MoneyList _$MoneyListFromJson(Map<String, dynamic> json) {
  return _MoneyList.fromJson(json);
}

/// @nodoc
mixin _$MoneyList {
  @SpendingsConverter()
  List<Money> get spendings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoneyListCopyWith<MoneyList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoneyListCopyWith<$Res> {
  factory $MoneyListCopyWith(MoneyList value, $Res Function(MoneyList) then) =
      _$MoneyListCopyWithImpl<$Res>;
  $Res call({@SpendingsConverter() List<Money> spendings});
}

/// @nodoc
class _$MoneyListCopyWithImpl<$Res> implements $MoneyListCopyWith<$Res> {
  _$MoneyListCopyWithImpl(this._value, this._then);

  final MoneyList _value;
  // ignore: unused_field
  final $Res Function(MoneyList) _then;

  @override
  $Res call({
    Object? spendings = freezed,
  }) {
    return _then(_value.copyWith(
      spendings: spendings == freezed
          ? _value.spendings
          : spendings // ignore: cast_nullable_to_non_nullable
              as List<Money>,
    ));
  }
}

/// @nodoc
abstract class _$MoneyListCopyWith<$Res> implements $MoneyListCopyWith<$Res> {
  factory _$MoneyListCopyWith(
          _MoneyList value, $Res Function(_MoneyList) then) =
      __$MoneyListCopyWithImpl<$Res>;
  @override
  $Res call({@SpendingsConverter() List<Money> spendings});
}

/// @nodoc
class __$MoneyListCopyWithImpl<$Res> extends _$MoneyListCopyWithImpl<$Res>
    implements _$MoneyListCopyWith<$Res> {
  __$MoneyListCopyWithImpl(_MoneyList _value, $Res Function(_MoneyList) _then)
      : super(_value, (v) => _then(v as _MoneyList));

  @override
  _MoneyList get _value => super._value as _MoneyList;

  @override
  $Res call({
    Object? spendings = freezed,
  }) {
    return _then(_MoneyList(
      spendings: spendings == freezed
          ? _value.spendings
          : spendings // ignore: cast_nullable_to_non_nullable
              as List<Money>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MoneyList implements _MoneyList {
  const _$_MoneyList(
      {@SpendingsConverter() final List<Money> spendings = const <Money>[]})
      : _spendings = spendings;

  factory _$_MoneyList.fromJson(Map<String, dynamic> json) =>
      _$$_MoneyListFromJson(json);

  @SpendingsConverter()
  final List<Money> _spendings;
  @override
  @JsonKey()
  @SpendingsConverter()
  List<Money> get spendings {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spendings);
  }

  @override
  String toString() {
    return 'MoneyList(spendings: $spendings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MoneyList &&
            const DeepCollectionEquality().equals(other.spendings, spendings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(spendings));

  @JsonKey(ignore: true)
  @override
  _$MoneyListCopyWith<_MoneyList> get copyWith =>
      __$MoneyListCopyWithImpl<_MoneyList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MoneyListToJson(this);
  }
}

abstract class _MoneyList implements MoneyList {
  const factory _MoneyList(
      {@SpendingsConverter() final List<Money> spendings}) = _$_MoneyList;

  factory _MoneyList.fromJson(Map<String, dynamic> json) =
      _$_MoneyList.fromJson;

  @override
  @SpendingsConverter()
  List<Money> get spendings => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MoneyListCopyWith<_MoneyList> get copyWith =>
      throw _privateConstructorUsedError;
}
