import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livle/providers/navigation.dart';

class BottomBar extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StateController<int> _pageIndex = ref.watch(pageIndexProvider.state);
    final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = ref.watch(bottomNavigationKeyProvider);
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: 0,
      height: 60.0,
      items: const <Widget>[
        Icon(FontAwesomeIcons.yenSign, size: 25),
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
