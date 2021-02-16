import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:livle/repositories/money.dart';
import 'package:livle/source/interfaces/money.dart';
import 'package:livle/source/money.dart';

part 'money_list.freezed.dart';
part 'money_list.g.dart';

class MoneyRepository extends ChangeNotifier {
  MoneyRepository({
    @required this.source,
    @required MoneyList moneyList,
  }) : _moneyList = moneyList;

  IMoneyDataSource source;
  MoneyList _moneyList;

  MoneyList get moneyList => _moneyList;
  set moneyList(MoneyList value) {
    _moneyList = value;
    notifyListeners();
  }
}

@freezed
abstract class MoneyList with _$MoneyList {
  const factory MoneyList({
    @SpendingsConverter() @Default(<Money>[]) List<Money> spendings,
  }) = _MoneyList;

  factory MoneyList.fromJson(Map<String, dynamic> json) => _$MoneyListFromJson(json);
}

final Provider<MoneyRepository> moneyRepositoryProvider = Provider<MoneyRepository>(
  (ProviderReference ref) => MoneyRepository(
    source: MoneyDataSource(),
    moneyList: const MoneyList(),
  ),
);

class SpendingsConverter implements JsonConverter<List<Money>, List<dynamic>> {
  const SpendingsConverter();

  @override
  List<Money> fromJson(List<dynamic> json) {
    if (json == null) {
      return null;
    }
    return json
        .map<Money>((dynamic e) => Money(
              amount: e['amount'] as int,
              title: e['title'] as String,
              date: e['date'] as Timestamp,
              memo: e['memo'] as String,
            ))
        .toList();
  }

  @override
  List<dynamic> toJson(List<Money> data) => data;
}
