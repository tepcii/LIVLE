// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MoneyList _$_$_MoneyListFromJson(Map<String, dynamic> json) {
  return _$_MoneyList(
    spendings:
        const SpendingsConverter().fromJson(json['spendings'] as List) ?? [],
  );
}

Map<String, dynamic> _$_$_MoneyListToJson(_$_MoneyList instance) =>
    <String, dynamic>{
      'spendings': const SpendingsConverter().toJson(instance.spendings),
    };
