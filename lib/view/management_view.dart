import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:livle/providers/user_register_view_provider.dart';

import 'pie_chart/pie_chart.dart';

class PieChartPage extends ConsumerWidget {
  final Color barColor = Colors.white;
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final double width = 22;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final UserRegisterViewModel userState = watch(userRegisterViewModelNotifierProvider);
    return Container(
      color: const Color(0xffeceaeb),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView(
          children: <Widget>[
            UserName(
              userState: userState,
            ),
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

class UserName extends StatelessWidget {
  const UserName({this.userState});
  final UserRegisterViewModel userState;

  @override
  Widget build(BuildContext context) {
    return Text(userState.originUser.name);
  }
}
