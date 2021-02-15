import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/all.dart';
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
    return _exists;
  }
}
