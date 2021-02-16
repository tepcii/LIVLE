import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livle/config/config.dart';
import 'package:livle/providers/navigation.dart';
import 'package:livle/view/pages/money.dart';
import 'common_parts/bottom_bar.dart';

class Home extends ConsumerWidget {
  Home();

  final List<Widget> _pages = <Widget>[
    Container(
      color: Colors.white,
      child: Center(
        child: MoneyPage(),
      ),
    ),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final StateController<int> _pageIndex = watch(pageIndexProvider);
    return Scaffold(
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
      body: _pages[_pageIndex.state],
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
