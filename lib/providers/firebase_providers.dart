import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livle/config/secret.dart';

final FirebaseApp firebaseApp = Firebase.app();

final Provider<FirebaseStorage> firebaseStorageProvider = Provider<FirebaseStorage>((ProviderRef<FirebaseStorage> ref) {
  final FirebaseApp app = firebaseApp;

  return FirebaseStorage.instanceFor(
    app: app,
    bucket: FIREBASE_STORAGE_BUCKET,
  );
});

final Provider<FirebaseAuth> firebaseAuthProvider = Provider<FirebaseAuth>((ProviderRef<FirebaseAuth> ref) => FirebaseAuth.instance);

final StreamProvider<User?> authStateChangesProvider = StreamProvider<User?>((StreamProviderRef<User?> ref) => ref.watch(firebaseAuthProvider).authStateChanges());
