import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:livle/repositories/money.dart';
import 'package:livle/repositories/money_list.dart';

final ChangeNotifierProvider<MoneyViewModel> moneyViewModelNotifierProvider = ChangeNotifierProvider<MoneyViewModel>(
  (ProviderReference ref) => MoneyViewModel(
    moneyRepository: ref.read(moneyRepositoryProvider),
  ),
);

class MoneyViewModel extends ChangeNotifier {
  MoneyViewModel({@required MoneyRepository moneyRepository}) : _moneyRepository = moneyRepository;
  final MoneyRepository _moneyRepository;

  MoneyRepository get moneyRepository => _moneyRepository;

  int _pieChartTouchedIndex;

  int get pieChartTouchedIndex => _pieChartTouchedIndex;
  set pieChartTouchedIndex(int value) {
    _pieChartTouchedIndex = value;
    notifyListeners();
  }

  Future<bool> fetch() async {
    bool _exists;
    await _moneyRepository.source.fetch().then((Map<String, dynamic> value) {
      if (value != null) {
        _moneyRepository.moneyList = MoneyList.fromJson(value);
        _exists = true;
      } else {
        _exists = false;
      }
    });
    notifyListeners();
    return _exists;
  }

  void pieChartTouchCallBack(PieTouchResponse pieTouchResponse) {
    if (pieTouchResponse.touchInput is FlLongPressEnd || pieTouchResponse.touchInput is FlPanEnd) {
      _pieChartTouchedIndex = -1;
    } else {
      _pieChartTouchedIndex = pieTouchResponse.touchedSectionIndex;
    }
    notifyListeners();
  }

  List<PieChartSectionData> showingSections() {
    final MoneyList _moneyList = moneyRepository.moneyList;
    final List<int> _fixedList = Iterable<int>.generate(_moneyList.spendings.length).toList();
    return _fixedList.map<PieChartSectionData>((int idx) {
      final Money _money = _moneyList.spendings[idx];
      final bool isTouched = idx == _pieChartTouchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      return PieChartSectionData(
        color: const Color(0xff0293ee),
        value: 40,
        title: '40%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
      );
    }).toList();
  }
}
