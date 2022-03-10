import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  Future<bool> init() async {
    final AuthService _auth = AuthService();
    final User firebaseUser = _auth.fetchCurrentUser();
    final String uid = firebaseUser.uid;
    await FirebaseFirestore.instance.collection('money').doc(uid).set(<String, dynamic>{
      'spendings': <Map<String, dynamic>>[],
    });

    return true;
  }

  @override
  Future<bool> add(Money money) async {
    final AuthService _auth = AuthService();
    final User firebaseUser = _auth.fetchCurrentUser();
    final String uid = firebaseUser.uid;
    await FirebaseFirestore.instance.collection('money').doc(uid).update(<String, dynamic>{
      'spendings': FieldValue.arrayUnion(<Map<String, dynamic>>[
        <String, dynamic>{
          'id': money.id,
          'amount': money.amount,
          'title': money.title,
          'memo': money.memo,
          'date': money.date,
          'artistId': money.artistId,
        },
      ]),
    });

    return true;
  }

  @override
  Future<bool> delete(Money money) async {
    return true;
  }
}
