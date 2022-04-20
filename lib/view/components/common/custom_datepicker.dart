import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CustomDatePicker extends DatePickerModel {
  CustomDatePicker({
    required DateTime currentTime,
    LocaleType locale = LocaleType.jp,
  }) : super(currentTime: currentTime, locale: locale);
}
