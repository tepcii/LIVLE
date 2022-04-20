import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:livle/providers/view_model/money.dart';
import 'package:livle/repositories/money.dart';

class MoneyDetailListView extends HookConsumerWidget {
  const MoneyDetailListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MoneyViewModel _moneyViewModel = ref.watch(moneyViewModelNotifierProvider);
    initializeDateFormatting('ja_JP');
    final DateFormat _formatter = DateFormat('yyyy/MM/dd（E）', 'ja_JP');
    return ListView.builder(
      itemCount: _moneyViewModel.moneyListData().length,
      itemBuilder: (BuildContext context, int index) {
        final Money _moneyData = _moneyViewModel.moneyListData()[index];
        return ListTile(
          leading: Icon(
            Icons.circle,
            color: Color(_moneyViewModel.artistRepository.artistList.getArtistById(_moneyData.artistId).color),
          ),
          title: Text(_moneyData.title),
          subtitle: Text(_formatter.format(_moneyData.date.toDate())),
          trailing: Text('${_moneyData.amount.toString()}円'),
        );
      },
    );
  }
}
