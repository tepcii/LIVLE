import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:livle/repositories/artist.dart';
import 'package:livle/services/auth_service.dart';
import 'package:livle/source/interfaces/artist.dart';

class ArtistDataSource implements IArtistDataSource {
  @override
  Future<Map<String, dynamic>> fetch() async {
    final AuthService _authService = AuthService();
    Map<String, dynamic> data;
    final String _uid = _authService.fetchCurrentUser().uid;
    await FirebaseFirestore.instance.collection('artists').doc(_uid).get().then((DocumentSnapshot value) {
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
    await FirebaseFirestore.instance.collection('artists').doc(uid).set(<String, dynamic>{
      'artists': <Map<String, dynamic>>[],
    });

    return true;
  }

  @override
  Future<bool> add(Artist money) async {
    return true;
  }

  @override
  Future<bool> delete(Artist money) async {
    return true;
  }
}
