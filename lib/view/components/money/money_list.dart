import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livle/providers/view_model/money.dart';
import 'package:livle/repositories/grouped_money.dart';
import 'package:livle/view/components/money/money_list_tile.dart';

class MoneyListView extends HookConsumerWidget {
  const MoneyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MoneyViewModel moneyViewModel = ref.watch(moneyViewModelNotifierProvider);
    final List<GroupedMoney> groupedMoneyList = moneyViewModel.groupedMoneyByArtistId();
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: Colors.grey,
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: groupedMoneyList.length,
        itemBuilder: (BuildContext context, int index) {
          final GroupedMoney groupedMoney = groupedMoneyList[index];
          return MoneyListTile(
            groupedMoney: groupedMoney,
            onTap: () => moneyViewModel.listTileTouch(index),
          );
        },
      ),
    );
  }
}
