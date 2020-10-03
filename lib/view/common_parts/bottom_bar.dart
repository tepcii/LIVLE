import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  // int _page;
  final GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    // _page = 0;
  }

  // void changePage(int index) {
  //   setState(() {
  //     _page = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: 0,
      height: 50.0,
      items: const <Widget>[
        Icon(Icons.add, size: 30),
        Icon(Icons.list, size: 30),
        Icon(Icons.compare_arrows, size: 30),
        Icon(Icons.call_split, size: 30),
        Icon(Icons.perm_identity, size: 30),
      ],
      color: Colors.white,
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.orangeAccent,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      // onTap: changePage,
    );
  }
}
