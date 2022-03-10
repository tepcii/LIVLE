import 'package:flutter/material.dart';

class OriginDrawer extends StatelessWidget {
  const OriginDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const <Widget>[
          DrawerHeader(
            child: Text('ヘッダー'),
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
          ),
          ListTile(
            title: Text('ボタン'),
            trailing: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
