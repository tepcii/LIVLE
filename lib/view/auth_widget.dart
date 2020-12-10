import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livle/providers/firebase_providers.dart';
import 'package:livle/providers/user_register_view_provider.dart';
import 'package:livle/services/auth_service.dart';
import 'package:livle/view/common_parts/loading_indicator.dart';

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
    return Scaffold(
      body: authStateChanges.when(
        data: (User user) => _data(context, user, userState),
        loading: () => const LoadingIndicator(),
        error: (_, __) => const Center(
          child: Text('エラー'),
        ),
      ),
    );
  }

  Widget _data(BuildContext context, User user, UserRegisterViewModel userState) {
    if (user != null) {
      final AuthService _auth = AuthService();
      _auth.fetchUserInfo(userState);
      return signedInBuilder(context);
    }
    return nonSignedInBuilder(context);
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
