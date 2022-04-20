import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:livle/repositories/schedule.dart';
import 'package:livle/services/auth_service.dart';
import 'package:livle/source/interfaces/schedule.dart';

class ScheduleDataSource implements IScheduleDataSource {
  @override
  Future<bool> init() async {
    final AuthService _auth = AuthService();
    final User? firebaseUser = _auth.fetchCurrentUser();
    final String uid = firebaseUser?.uid ?? '';
    await FirebaseFirestore.instance.collection('schedule').doc(uid).set(<String, dynamic>{
      'schedules': <Map<String, dynamic>>[],
    });

    return true;
  }

  @override
  Future<bool> add(Schedule schedule) async {
    return true;
  }

  @override
  Future<bool> delete(Schedule schedule) async {
    return true;
  }
}
