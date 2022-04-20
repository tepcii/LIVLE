import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livle/providers/view_model/money_register.dart';
import 'package:livle/view/components/money_register/amount.dart';
import 'package:livle/view/components/money_register/artist.dart';
import 'package:livle/view/components/money_register/date.dart';
import 'package:livle/view/components/money_register/memo.dart';
import 'package:livle/view/components/money_register/register_button.dart';
import 'package:livle/view/components/money_register/title.dart';

class RegisterMoney extends HookConsumerWidget {
  const RegisterMoney({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MoneyRegisterViewModel _moneyRegisterViewModel = ref.watch(moneyRegisterViewModelNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('お金登録'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _moneyRegisterViewModel.formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: <Widget>[
                Container(
                  child: const MoneyRegisterTitleInput(),
                  margin: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                ),
                Container(
                  child: const MoneyRegisterAmountInput(),
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                ),
                Container(
                  child: const MoneyRegisterDateInput(),
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                ),
                Container(
                  child: const MoneyRegisterArtistInput(),
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                ),
                Container(
                  child: const MoneyRegisterMemoInput(),
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                ),
                Container(
                  child: const MoneyRegisterButton(),
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
