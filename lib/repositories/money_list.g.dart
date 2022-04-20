// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MoneyList _$$_MoneyListFromJson(Map<String, dynamic> json) => _$_MoneyList(
      spendings: json['spendings'] == null
          ? const <Money>[]
          : const SpendingsConverter().fromJson(json['spendings'] as List),
    );

Map<String, dynamic> _$$_MoneyListToJson(_$_MoneyList instance) =>
    <String, dynamic>{
      'spendings': const SpendingsConverter().toJson(instance.spendings),
    };
