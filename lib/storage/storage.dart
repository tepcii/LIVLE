import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<FirebaseApp> myFirebaseApp() {
  return FirebaseApp.configure(
    name: "LIVLE",
    options: FirebaseOptions(
      googleAppID: Platform.isIOS ? "1:43252205480:ios:12f2f9b0ce763454a17f9d" : "1:43252205480:android:8380f70f051b41f7a17f9d",
      gcmSenderID: "43252205480",
      apiKey: "AIzaSyDdI_bXV5mZY00BD7i5OE-uImnRkd0LEVk",
      projectID: "livle-dev-f20c6",
    ),
  );
}

Future<FirebaseStorage> myFirebaseStorage() async {
  final FirebaseApp app = await myFirebaseApp();
  return FirebaseStorage(
    app: app,
    storageBucket: 'gs://livle-dev-f20c6.appspot.com/',
  );
}

