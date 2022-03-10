import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livle/providers/firebase_providers.dart';
import 'package:livle/providers/firestore_providers.dart';
import 'package:livle/providers/view_model/user_register.dart';
import 'package:livle/view/components/common/loading_indicator.dart';

class AuthWidget extends ConsumerWidget {
  const AuthWidget({
    Key key,
    @required this.signedInBuilder,
    @required this.nonSignedInBuilder,
  }) : super(key: key);
  final WidgetBuilder nonSignedInBuilder;
  final WidgetBuilder signedInBuilder;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final AsyncValue<User> authStateChanges = watch(authStateChangesProvider);
    final UserRegisterViewModel userState = watch(userRegisterViewModelNotifierProvider);
    final AsyncValue<Map<String, dynamic>> _userStream = watch(userStreamProvider);
    return Scaffold(
      body: authStateChanges.when(
        data: (User user) => _data(context, user, userState, _userStream),
        loading: () => const LoadingIndicator(),
        error: (_, __) => const Center(
          child: Text('エラー'),
        ),
      ),
    );
  }

  Widget _data(BuildContext context, User user, UserRegisterViewModel userState, AsyncValue<Map<String, dynamic>> userStream) {
    // logout();
    if (user != null) {
      return userStream.when(
        data: (Map<String, dynamic> data) {
          userState.setUserInfoToLocalState(data);
          return signedInBuilder(context);
        },
        loading: () => const LoadingIndicator(),
        error: (_, __) => const Center(
          child: Text('エラー'),
        ),
      );
    }
    return nonSignedInBuilder(context);
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
