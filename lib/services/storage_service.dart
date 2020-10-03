import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:livle/services/auth_service.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class StorageService {

  // カレントユーザーのアイコンを変更する
  static Future<StorageTaskSnapshot> updateUserIcon(BuildContext context, String _iconImagePath) async {
    final String _fileExt = basename(_iconImagePath).split('.').last;
    final AuthService _auth = AuthService();
    final User user = _auth.fetchCurrentUser();
    final String uid = user.uid;
    final File _imageFile = File(_iconImagePath);
    final FirebaseStorage _storage = Provider.of<FirebaseStorage>(context, listen: false);
    final StorageReference ref = _storage.ref().child("user_icons/${uid + "." + _fileExt}");
    final StorageUploadTask uploadTask = ref.putFile(_imageFile);
    return await uploadTask.onComplete;
  }

}