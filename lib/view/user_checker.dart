import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livle/providers/user_register_view_provider.dart';
import 'package:livle/view/components/common/loading_indicator.dart';
import 'package:livle/view/home.dart';
import 'package:livle/view/tutorial_slider_view.dart';

import '../services/auth_service.dart';

class UserCheckerWidget extends ConsumerWidget {
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final UserRegisterViewModel userState = watch(userRegisterViewModelNotifierProvider);
    return FutureBuilder<bool>(
      future: authService.fetchUserInfo(userState),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data) {
            return Home();
          } else {
            return const TutorialSliderView();
          }
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
