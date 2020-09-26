import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:livle/config/config.dart';
import 'package:livle/config/secret.dart';

final FutureProvider<FirebaseApp> firebaseAppProvider = FutureProvider<FirebaseApp>((ProviderReference ref) {
  return Firebase.initializeApp(
    name: AppConfig.APP_NAME,
    options: FirebaseOptions(
      appId: Platform.isIOS ? IOS_APP_ID : ANDROID_APP_ID,
      messagingSenderId: FIREBASE_MESSAGING_SENDER_ID,
      apiKey: FIREBASE_API_KEY,
      projectId: FIREBASE_PROJECT_ID,
    )
  );
});

final Provider<FirebaseStorage> firebaseStorageProvider = Provider<FirebaseStorage>((ProviderReference ref) {
  final app = ref.watch(firebaseAppProvider);

  return FirebaseStorage(
    app: app.data.value,
    storageBucket: FIREBASE_STORAGE_BUCKET,
  );
});

final Provider<FirebaseAuth> firebaseAuthProvider = Provider<FirebaseAuth>((ProviderReference ref) => FirebaseAuth.instance);

final StreamProvider<User> authStateChangesProvider = StreamProvider<User>((ProviderReference ref) => ref.watch(firebaseAuthProvider).authStateChanges());