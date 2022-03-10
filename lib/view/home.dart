import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livle/config/config.dart';
import 'package:livle/providers/navigation.dart';
import 'package:livle/view/components/common/bottom_bar.dart';
import 'package:livle/view/components/common/drawer.dart';
import 'package:livle/view/components/common/header_user_icon.dart';
import 'package:livle/view/pages/artist.dart';
import 'package:livle/view/pages/community.dart';
import 'package:livle/view/pages/money.dart';
import 'package:livle/view/pages/schedule.dart';

class Home extends ConsumerWidget {
  Home();

  final List<Widget> _pages = <Widget>[
    MoneyPage(),
    const SchedulePage(),
    const ArtistPage(),
    const CommunityPage(),
  ];

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final StateController<int> _pageIndex = watch(pageIndexProvider);
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[
          HeaderUserIcon(),
        ],
        backgroundColor: AppColor.primaryColor,
      ),
      drawer: const OriginDrawer(),
      body: _pages[_pageIndex.state],
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
