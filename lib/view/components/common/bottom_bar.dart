import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livle/providers/navigation.dart';

class BottomBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final StateController<int> _pageIndex = watch(pageIndexProvider);
    final StateController<GlobalKey<CurvedNavigationBarState>> _bottomNavigationKey = watch(bottomNavigationKeyProvider);
    return CurvedNavigationBar(
      key: _bottomNavigationKey.state,
      index: 0,
      height: 50.0,
      items: const <Widget>[
        Icon(Icons.money, size: 30),
        Icon(Icons.list, size: 30),
        Icon(Icons.compare_arrows, size: 30),
        Icon(Icons.call_split, size: 30),
      ],
      color: Colors.orangeAccent,
      buttonBackgroundColor: Colors.orangeAccent,
      backgroundColor: Colors.white,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      onTap: (int index) => _pageIndex.state = index,
    );
  }
}
