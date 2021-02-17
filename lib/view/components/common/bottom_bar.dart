import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:livle/providers/navigation.dart';

class BottomBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final StateController<int> _pageIndex = watch(pageIndexProvider);
    final StateController<GlobalKey<CurvedNavigationBarState>> _bottomNavigationKey = watch(bottomNavigationKeyProvider);
    return CurvedNavigationBar(
      key: _bottomNavigationKey.state,
      index: 0,
      height: 60.0,
      items: const <Widget>[
        Icon(FontAwesomeIcons.chartPie, size: 25),
        Icon(FontAwesomeIcons.calendarAlt, size: 25),
        Icon(Icons.library_music_outlined, size: 30),
        Icon(FontAwesomeIcons.comments, size: 25),
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
