import 'package:livle/config/config.dart';

String userIdValidator(String value) {
  if (!_validator(value, regs['userId'])) {
    return '半角英数字とアンダーバー以外使用できません。';
  } else if (value.length > 20 || value.isEmpty) {
    return '1文字以上20文字以内で入力してください';
  }
  return null;
}

String userNameValidator(String value) {
  if (value.length > 20 || value.isEmpty) {
    return '1文字以上20文字以内で入力してください';
  }
  return null;
}

String userDescValidator(String value) {
  if (value.length > 100) {
    return '100文字以内で入力してください';
  }
  return null;
}

bool _validator(String value, String reg) {
  final RegExp regex = RegExp(reg);
  if (!regex.hasMatch(value))
    return false;
  else
    return true;
}
