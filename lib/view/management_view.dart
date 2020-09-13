import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pie_chart/pie_chart.dart';

class PieChartPage extends StatelessWidget {
  final Color barColor = Colors.white;
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final double width = 22;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffeceaeb),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView(
          children: <Widget>[
            UserName(),
            MoneyPieChart(),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}

class UserName extends StatefulWidget {
  @override
  _UserNameState createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  @override
  void initState() {
    super.initState();
    _fetchUserNameFromFireBase();
  }

  void _fetchUserNameFromFireBase() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User currentUser = _auth.currentUser;
    String uid = "";
    if (currentUser == null)
      uid = "ユーザーなし";
    else
      uid = currentUser.uid;
//    Provider.of<UserController>(context, listen: false).login(uid);
  }

  @override
  Widget build(BuildContext context) {
    return Text("TEST");
  }
}
