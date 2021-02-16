import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livle/services/auth_service.dart';

final StreamProvider<Map<String, dynamic>> userStreamProvider = StreamProvider<Map<String, dynamic>>((_) {
  final CollectionReference ref = FirebaseFirestore.instance.collection('users');
  final AuthService _authService = AuthService();
  final String _uid = _authService.fetchCurrentUser().uid;
  return ref.doc(_uid).snapshots().map(
        (DocumentSnapshot value) => value.data(),
      );
});

final StreamProvider<Map<String, dynamic>> moneyStreamProvider = StreamProvider<Map<String, dynamic>>((_) {
  final CollectionReference ref = FirebaseFirestore.instance.collection('money');
  final AuthService _authService = AuthService();
  final String _uid = _authService.fetchCurrentUser().uid;
  return ref.doc(_uid).snapshots().map(
        (DocumentSnapshot value) => value.data(),
      );
});
