import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livle/providers/view_model/user_register.dart';
import 'package:livle/view/components/common/loading_indicator.dart';
import 'package:livle/view/components/tutorial/tutorial_slider_view.dart';
import 'package:livle/view/home.dart';

import '../services/auth_service.dart';

class UserCheckerWidget extends ConsumerWidget {
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserRegisterViewModel userState = ref.watch(userRegisterViewModelNotifierProvider);
    return FutureBuilder<bool>(
      future: authService.fetchUserInfo(userState),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
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
