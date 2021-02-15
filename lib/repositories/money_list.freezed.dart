// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'money_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MoneyList _$MoneyListFromJson(Map<String, dynamic> json) {
  return _MoneyList.fromJson(json);
}

/// @nodoc
class _$MoneyListTearOff {
  const _$MoneyListTearOff();

// ignore: unused_element
  _MoneyList call(
      {@SpendingsConverter() List<Money> spendings = const <Money>[]}) {
    return _MoneyList(
      spendings: spendings,
    );
  }

// ignore: unused_element
  MoneyList fromJson(Map<String, Object> json) {
    return MoneyList.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $MoneyList = _$MoneyListTearOff();

/// @nodoc
mixin _$MoneyList {
  @SpendingsConverter()
  List<Money> get spendings;

  Map<String, dynamic> toJson();
  $MoneyListCopyWith<MoneyList> get copyWith;
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
    Object spendings = freezed,
  }) {
    return _then(_value.copyWith(
      spendings:
          spendings == freezed ? _value.spendings : spendings as List<Money>,
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
    Object spendings = freezed,
  }) {
    return _then(_MoneyList(
      spendings:
          spendings == freezed ? _value.spendings : spendings as List<Money>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_MoneyList implements _MoneyList {
  const _$_MoneyList({@SpendingsConverter() this.spendings = const <Money>[]})
      : assert(spendings != null);

  factory _$_MoneyList.fromJson(Map<String, dynamic> json) =>
      _$_$_MoneyListFromJson(json);

  @JsonKey(defaultValue: const <Money>[])
  @override
  @SpendingsConverter()
  final List<Money> spendings;

  @override
  String toString() {
    return 'MoneyList(spendings: $spendings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MoneyList &&
            (identical(other.spendings, spendings) ||
                const DeepCollectionEquality()
                    .equals(other.spendings, spendings)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(spendings);

  @override
  _$MoneyListCopyWith<_MoneyList> get copyWith =>
      __$MoneyListCopyWithImpl<_MoneyList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MoneyListToJson(this);
  }
}

abstract class _MoneyList implements MoneyList {
  const factory _MoneyList({@SpendingsConverter() List<Money> spendings}) =
      _$_MoneyList;

  factory _MoneyList.fromJson(Map<String, dynamic> json) =
      _$_MoneyList.fromJson;

  @override
  @SpendingsConverter()
  List<Money> get spendings;
  @override
  _$MoneyListCopyWith<_MoneyList> get copyWith;
}
