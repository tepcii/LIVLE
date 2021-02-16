import 'package:livle/repositories/money.dart';

abstract class IMoneyDataSource {
  Future<Map<String, dynamic>> fetch();
  Stream<Map<String, dynamic>> stream();
  Future<bool> add(Money money);
  Future<bool> delete(Money money);
}
