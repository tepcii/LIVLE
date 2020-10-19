import 'package:flutter/material.dart';
import 'package:livle/config/config.dart';
import 'package:livle/view/common_parts/loading_indicator.dart';
import 'package:livle/view/management_view.dart';
import 'package:livle/view/tutorial_slider_view.dart';

import '../services/auth_service.dart';
import 'common_parts/bottom_bar.dart';

class UserCheckerWidget extends StatefulWidget {
  @override
  _UserCheckerWidgetState createState() => _UserCheckerWidgetState();
}

class _UserCheckerWidgetState extends State<UserCheckerWidget> {
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: authService.fetchUserInfo(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.isNotEmpty) {
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

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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