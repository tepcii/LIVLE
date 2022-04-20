import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livle/config/config.dart';
import 'package:livle/providers/view_model/money_register.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class MoneyRegisterButton extends HookConsumerWidget {
  const MoneyRegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MoneyRegisterViewModel _moneyRegisterViewModel = ref.watch(moneyRegisterViewModelNotifierProvider);
    return RoundedLoadingButton(
      controller: _moneyRegisterViewModel.registerBtnController,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: const Text(
          '登録',
          style: TextStyle(
            fontSize: 23,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      color: AppColor.registerButtonColor,
      onPressed: () => _moneyRegisterViewModel.onPressedRegisterButton(context),
    );
  }
}
