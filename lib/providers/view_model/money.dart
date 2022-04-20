import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:livle/repositories/artist.dart';
import 'package:livle/repositories/artist_list.dart';
import 'package:livle/repositories/grouped_money.dart';
import 'package:livle/repositories/money.dart';
import 'package:livle/repositories/money_list.dart';

final ChangeNotifierProvider<MoneyViewModel> moneyViewModelNotifierProvider = ChangeNotifierProvider<MoneyViewModel>(
  (ChangeNotifierProviderRef<MoneyViewModel> ref) => MoneyViewModel(
    moneyRepository: ref.watch(moneyRepositoryProvider),
    artistRepository: ref.watch(artistsRepositoryProvider),
  ),
);

class MoneyViewModel extends ChangeNotifier {
  MoneyViewModel({
    required MoneyRepository moneyRepository,
    required ArtistRepository artistRepository,
  })  : _moneyRepository = moneyRepository,
        _artistRepository = artistRepository;

  final MoneyRepository _moneyRepository;
  final ArtistRepository _artistRepository;

  MoneyRepository get moneyRepository => _moneyRepository;
  ArtistRepository get artistRepository => _artistRepository;

  late int _pieChartTouchedIndex;

  int get pieChartTouchedIndex => _pieChartTouchedIndex;
  set pieChartTouchedIndex(int value) {
    _pieChartTouchedIndex = value;
    notifyListeners();
  }

  void pieChartTouchCallBack(FlTouchEvent event, PieTouchResponse? res) {
    if (!event.isInterestedForInteractions || res == null || res.touchedSection == null) {
      _pieChartTouchedIndex = -1;
    } else {
      _pieChartTouchedIndex = res.touchedSection!.touchedSectionIndex;
    }
    notifyListeners();
  }

  void listTileTouch(int index) {
    _pieChartTouchedIndex = index;
    notifyListeners();
  }

  int totalAmount() {
    int _total = 0;
    final List<Money> _spendings = moneyRepository.moneyList.spendings;
    for (final Money money in _spendings) {
      _total += money.amount;
    }
    return _total;
  }

  List<GroupedMoney> groupedMoneyByArtistId() {
    final List<Money> _spendings = moneyRepository.moneyList.spendings;
    final Map<String, List<Money>> result = groupBy<Money, String>(_spendings, (Money money) => money.artistId);
    final List<GroupedMoney> groupedMoneyList = <GroupedMoney>[];
    result.forEach((String key, List<Money> value) {
      int _totalAmount = 0;
      for (final Money money in value) {
        _totalAmount += money.amount;
      }
      groupedMoneyList.add(
        GroupedMoney(
          artist: _artistRepository.artistList.artists.singleWhere((Artist artist) => artist.id == key),
          totalAmount: _totalAmount,
        ),
      );
    });

    return groupedMoneyList;
  }

  List<Money> moneyListData() {
    final List<Money> _spendings = moneyRepository.moneyList.spendings;
    return _spendings;
  }

  List<PieChartSectionData> showingSections() {
    final List<GroupedMoney> _groupedMoneyList = groupedMoneyByArtistId();
    final List<int> _fixedList = Iterable<int>.generate(_groupedMoneyList.length).toList();
    final List<PieChartSectionData> list = _fixedList.map<PieChartSectionData>((int idx) {
      final GroupedMoney _money = _groupedMoneyList[idx];
      final bool isTouched = idx == _pieChartTouchedIndex;
      // final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      return PieChartSectionData(
        color: Color(_money.artist.color),
        value: _money.totalAmount.toDouble(),
        showTitle: false,
        radius: radius,
      );
    }).toList();
    return list;
  }
}
