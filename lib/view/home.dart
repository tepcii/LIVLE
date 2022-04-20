import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livle/config/config.dart';
import 'package:livle/providers/navigation.dart';
import 'package:livle/view/components/common/bottom_bar.dart';
import 'package:livle/view/components/common/drawer.dart';
import 'package:livle/view/components/common/header_user_icon.dart';
import 'package:livle/view/pages/artist.dart';
import 'package:livle/view/pages/community.dart';
import 'package:livle/view/pages/money.dart';
import 'package:livle/view/pages/schedule.dart';

class Home extends HookConsumerWidget {
  Home();

  final List<Widget> _pages = <Widget>[
    MoneyPage(),
    const SchedulePage(),
    const ArtistPage(),
    const CommunityPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int _pageIndex = ref.watch(pageIndexProvider);
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[
          HeaderUserIcon(),
        ],
        backgroundColor: AppColor.primaryColor,
      ),
      drawer: const OriginDrawer(),
      body: _pages[_pageIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
