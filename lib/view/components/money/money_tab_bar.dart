import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:livle/view/components/money/graph_view.dart';
import 'package:livle/view/components/money/list_view.dart';

class MoneyTabBarView extends StatefulWidget {
  const MoneyTabBarView({Key? key}) : super(key: key);

  @override
  _MoneyTabBarViewState createState() => _MoneyTabBarViewState();
}

class _MoneyTabBarViewState extends State<MoneyTabBarView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _tabViews = <Widget>[
    const MoneyGraphView(),
    const MoneyDetailListView(),
  ];

  final List<Widget> _tabs = <Widget>[
    const Tab(icon: Icon(FontAwesomeIcons.chartPie)),
    const Tab(icon: Icon(FontAwesomeIcons.list)),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabViews.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabViews.length,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
            child: Material(
              color: Theme.of(context).primaryColor,
              child: TabBar(
                indicatorColor: Colors.black,
                tabs: _tabs,
                controller: _tabController,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              controller: _tabController,
              children: _tabViews,
            ),
          ),
        ],
      ),
    );
  }
}
