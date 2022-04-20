import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livle/providers/view_model/money_register.dart';

class MoneyRegisterArtistInput extends HookConsumerWidget {
  const MoneyRegisterArtistInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MoneyRegisterViewModel _moneyRegisterViewModel = ref.watch(moneyRegisterViewModelNotifierProvider);
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: 'アーティスト',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.cyan,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
      items: _moneyRegisterViewModel.artistDropDownList,
      onChanged: (String? value) => _moneyRegisterViewModel.artistId = value ?? '',
    );
  }
}
