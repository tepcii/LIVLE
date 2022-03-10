import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:livle/config/config.dart';
import 'package:livle/providers/view_model/money_register.dart';
import 'package:livle/services/input_validator.dart';

class MoneyRegisterAmountInput extends ConsumerWidget {
  const MoneyRegisterAmountInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final MoneyRegisterViewModel _moneyRegisterViewModel = watch(moneyRegisterViewModelNotifierProvider);
    return TextFormField(
      cursorColor: Colors.black,
      autovalidateMode: AutovalidateMode.always,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(
          FontAwesomeIcons.yenSign,
          color: AppColor.primaryColor,
        ),
        suffixText: '円',
        suffixStyle: TextStyle(
          color: Colors.black,
        ),
        labelText: '金額',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintText: '例：1000',
        hintStyle: TextStyle(
          color: Colors.grey,
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
      validator: (String value) => OriginValidators.moneyAmount(value),
      onChanged: (String value) => _moneyRegisterViewModel.amount = value,
    );
  }
}
