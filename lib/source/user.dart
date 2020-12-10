import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:livle/repositories/user.dart';
import 'package:livle/services/auth_service.dart';
import 'package:livle/services/storage_service.dart';
import 'package:livle/source/interfaces/user.dart';

class UserDataSource implements IUserDataSource {
  UserDataSource({
    @required this.storage,
  });
  final FirebaseStorage storage;

  @override
  Future<bool> registerUser(OriginUser user) async {
    // ユーザー登録処理
    if (user.pickedImage) {
      // 画像が選択されていればストレージに登録
      final TaskSnapshot snapshot = await StorageService.updateUserIcon(storage, user.iconImagePath);
      if (snapshot.state == TaskState.success) {
        // print(await snapshot.ref.getDownloadURL());
      } else {
        print('Error on icon image upload task.');
        return false;
      }
    }

    final AuthService _auth = AuthService();
    final User firebaseUser = _auth.fetchCurrentUser();
    final String uid = firebaseUser.uid;
    await FirebaseFirestore.instance.collection('users').doc(uid).set(<String, dynamic>{
      'display_id': user.id,
      'isBanned': false,
      'isOfficial': false,
      'name': user.name,
      'description': user.description,
    });

    return true;
  }

  @override
  Future<bool> updateUser(OriginUser user) async {
    return true;
  }
}
