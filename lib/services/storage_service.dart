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
    String _fileExt = basename(_iconImagePath).split(".").last;
    AuthService _auth = AuthService();
    User user = _auth.fetchCurrentUser();
    String uid = user.uid;
    File _imageFile = File(_iconImagePath);
    FirebaseStorage _storage = Provider.of<FirebaseStorage>(context, listen: false);
    StorageReference ref = _storage.ref().child("user_icons/${uid + "." + _fileExt}");
    final StorageUploadTask uploadTask = ref.putFile(_imageFile);
    return await uploadTask.onComplete;
  }

}