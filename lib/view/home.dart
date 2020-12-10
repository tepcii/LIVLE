import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livle/config/config.dart';
import 'package:livle/providers/user_register_view_provider.dart';
import 'package:livle/view/common_parts/loading_indicator.dart';
import 'package:livle/view/management_view.dart';
import 'package:livle/view/tutorial_slider_view.dart';

import '../services/auth_service.dart';
import 'common_parts/bottom_bar.dart';

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
            print(snapshot.data);
            return const Home();
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

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          actions: const <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null,
            ),
          ],
          backgroundColor: AppColor.primaryColor,
        ),
        body: Center(
          child: PieChartPage(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
