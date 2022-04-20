import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livle/services/auth_service.dart';

final StreamProvider<Map<String, dynamic>?> userStreamProvider = StreamProvider<Map<String, dynamic>?>((_) {
  final CollectionReference<Map<String, dynamic>> ref = FirebaseFirestore.instance.collection('users');
  final AuthService _authService = AuthService();
  final String _uid = _authService.fetchCurrentUser()?.uid ?? '';
  return ref.doc(_uid).snapshots().map((DocumentSnapshot<Map<String, dynamic>> value) => value.data());
});

final StreamProvider<Map<String, dynamic>?> moneyStreamProvider = StreamProvider<Map<String, dynamic>?>((_) {
  final CollectionReference<Map<String, dynamic>> ref = FirebaseFirestore.instance.collection('money');
  final AuthService _authService = AuthService();
  final String _uid = _authService.fetchCurrentUser()?.uid ?? '';
  return ref.doc(_uid).snapshots().map((DocumentSnapshot<Map<String, dynamic>> value) => value.data());
});

final StreamProvider<Map<String, dynamic>?> artistsStreamProvider = StreamProvider<Map<String, dynamic>?>((_) {
  final CollectionReference<Map<String, dynamic>> ref = FirebaseFirestore.instance.collection('artists');
  final AuthService _authService = AuthService();
  final String _uid = _authService.fetchCurrentUser()?.uid ?? '';
  return ref.doc(_uid).snapshots().map((DocumentSnapshot<Map<String, dynamic>> value) => value.data());
});

final StreamProvider<Map<String, dynamic>?> scheduleStreamProvider = StreamProvider<Map<String, dynamic>?>((_) {
  final CollectionReference<Map<String, dynamic>> ref = FirebaseFirestore.instance.collection('schedule');
  final AuthService _authService = AuthService();
  final String _uid = _authService.fetchCurrentUser()?.uid ?? '';
  return ref.doc(_uid).snapshots().map((DocumentSnapshot<Map<String, dynamic>> value) => value.data());
});
