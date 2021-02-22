import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:livle/config/config.dart';
import 'package:livle/providers/view_model/money_register.dart';
import 'package:livle/services/input_validator.dart';

class MoneyRegisterMemoInput extends ConsumerWidget {
  const MoneyRegisterMemoInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final MoneyRegisterViewModel _moneyRegisterViewModel = watch(moneyRegisterViewModelNotifierProvider);
    const String _maxLength = '500';
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      cursorColor: Colors.black,
      autovalidateMode: AutovalidateMode.always,
      maxLength: int.parse(_maxLength),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(
          FontAwesomeIcons.pen,
          color: AppColor.primaryColor,
        ),
        suffixText: '${_moneyRegisterViewModel.memo.length}/$_maxLength',
        suffixStyle: const TextStyle(
          color: Colors.black,
        ),
        labelText: 'メモ',
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        hintText: '',
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.cyan,
            width: 2,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
      validator: (String value) => OriginValidators.moneyTitle(value, _maxLength),
      onChanged: (String value) => _moneyRegisterViewModel.memo = value,
    );
  }
}
