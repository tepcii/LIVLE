import 'package:livle/repositories/money.dart';

abstract class IMoneyDataSource {
  Future<Map<String, dynamic>?> fetch();
  Future<bool> add(Money money);
  Future<bool> delete(Money money);
  Future<bool> init();
}
