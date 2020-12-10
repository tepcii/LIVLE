import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:livle/config/config.dart';
import 'package:livle/config/secret.dart';

Future<FirebaseApp> myFirebaseApp() async {
  if (Firebase.apps.isNotEmpty) {
    return Firebase.app(AppConfig.APP_NAME);
  } else {
    return Firebase.initializeApp(
      name: AppConfig.APP_NAME,
      options: FirebaseOptions(
        appId: Platform.isIOS ? IOS_APP_ID : ANDROID_APP_ID,
        messagingSenderId: FIREBASE_MESSAGING_SENDER_ID,
        apiKey: FIREBASE_API_KEY,
        projectId: FIREBASE_PROJECT_ID,
      ),
    );
  }
}

Future<FirebaseStorage> myFirebaseStorage(FirebaseApp app) async {
  return FirebaseStorage.instanceFor(
    app: app,
    bucket: FIREBASE_STORAGE_BUCKET,
  );
}
