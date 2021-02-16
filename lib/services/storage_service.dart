import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:livle/services/auth_service.dart';
import 'package:path/path.dart';

class StorageService {
  // カレントユーザーのアイコンを変更する
  static UploadTask updateUserIcon(FirebaseStorage storage, String _iconImagePath) {
    final String _fileExt = basename(_iconImagePath).split('.').last;
    final AuthService _auth = AuthService();
    final User user = _auth.fetchCurrentUser();
    final String uid = user.uid;
    final File _imageFile = File(_iconImagePath);
    final Reference ref = storage.ref().child("user_icons/${uid + "." + _fileExt}");
    final UploadTask uploadTask = ref.putFile(_imageFile);
    return uploadTask;
  }
}
