import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:livle/config/config.dart';
import 'package:livle/view/common_parts/loading_indicator.dart';
import 'package:livle/view/management_view.dart';

import 'common_parts/bottom_bar.dart';
import '../services/auth_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService authService;
  bool _isRegisteredUser = false;

  @override
  void initState() { 
    super.initState();
    authService = AuthService();
    // ユーザーが登録済みかどうかをしらべる
    authService.fetchUserInfo().then((List userInfo) {
      // 登録済みの場合
      if (userInfo.length > 0) {
        // TODO: グラフにデータを反映
        _isRegisteredUser = false;
      } else {
        // 未登録の場合、ユーザー登録画面に遷移
        Navigator.pushReplacementNamed(context, "/tutorial");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
        backgroundColor: AppColor.primaryColor,
      ),
      body: _isRegisteredUser ? Center(
        child: PieChartPage(),
      ) : LoadingIndicator(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
