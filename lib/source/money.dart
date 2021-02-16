import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:livle/repositories/money.dart';
import 'package:livle/services/auth_service.dart';
import 'package:livle/source/interfaces/money.dart';

class MoneyDataSource implements IMoneyDataSource {
  @override
  Future<Map<String, dynamic>> fetch() async {
    final AuthService _authService = AuthService();
    Map<String, dynamic> data;
    final String _uid = _authService.fetchCurrentUser().uid;
    await FirebaseFirestore.instance.collection('money').doc(_uid).get().then((DocumentSnapshot value) {
      if (value.exists) {
        data = value.data();
      }
    });
    return data;
  }

  @override
  Stream<Map<String, dynamic>> stream() {
    final AuthService _authService = AuthService();
    final String _uid = _authService.fetchCurrentUser().uid;
    return FirebaseFirestore.instance.collection('money').doc(_uid).snapshots().map((DocumentSnapshot value) => value.data());
  }

  @override
  Future<bool> add(Money money) async {
    return true;
  }

  @override
  Future<bool> delete(Money money) async {
    return true;
  }
}
