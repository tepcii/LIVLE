import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:livle/providers/view_model/money_register.dart';
import 'package:livle/services/input_validator.dart';
import 'package:livle/view/components/common/custom_datepicker.dart';

class MoneyRegisterDateInput extends HookConsumerWidget {
  const MoneyRegisterDateInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MoneyRegisterViewModel _moneyRegisterViewModel = ref.watch(moneyRegisterViewModelNotifierProvider);
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextFormField(
              controller: _moneyRegisterViewModel.dateController,
              cursorColor: Colors.black,
              autovalidateMode: AutovalidateMode.always,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: '日付',
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                hintText: DateFormat('例：yyyy/MM/dd').format(DateTime.now()).toString(),
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
              validator: (String? value) => OriginValidators.moneyDate(value ?? ''),
              onChanged: (String value) => _moneyRegisterViewModel.title = value,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            DatePicker.showPicker(
              context,
              showTitleActions: true,
              onConfirm: (DateTime date) {
                print('confirm $date');
                _moneyRegisterViewModel.date = Timestamp.fromDate(date);
              },
              locale: LocaleType.jp,
              pickerModel: CustomDatePicker(locale: LocaleType.jp, currentTime: DateTime.now()),
              theme: const DatePickerTheme(
                cancelStyle: TextStyle(
                  color: Colors.black,
                ),
                doneStyle: TextStyle(
                  color: Colors.blueAccent,
                ),
                headerColor: Colors.orangeAccent,
              ),
            );
          },
          child: const Icon(
            FontAwesomeIcons.calendarAlt,
          ),
        ),
      ],
    );
  }
}
