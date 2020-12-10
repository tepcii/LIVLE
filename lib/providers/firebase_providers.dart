import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:livle/config/config.dart';
import 'package:livle/config/secret.dart';

final FirebaseApp firebaseApp = Firebase.app(AppConfig.APP_NAME);

final Provider<FirebaseStorage> firebaseStorageProvider = Provider<FirebaseStorage>((ProviderReference ref) {
  final FirebaseApp app = firebaseApp;

  return FirebaseStorage.instanceFor(
    app: app,
    bucket: FIREBASE_STORAGE_BUCKET,
  );
});

final Provider<FirebaseAuth> firebaseAuthProvider = Provider<FirebaseAuth>((ProviderReference ref) => FirebaseAuth.instance);

final StreamProvider<User> authStateChangesProvider = StreamProvider<User>((ProviderReference ref) => ref.watch(firebaseAuthProvider).authStateChanges());
