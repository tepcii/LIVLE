// ignore: avoid_classes_with_only_static_members
class OriginValidators {
  static String userIdRegs = r'^[a-zA-Z0-9_]+$';

  static String? userId(String value, String maxLength) {
    if (!_validator(value, userIdRegs)) {
      return '半角英数字とアンダーバー以外使用できません。';
    } else if (value.length > int.parse(maxLength) || value.isEmpty) {
      return '1文字以上$maxLength文字以内で入力してください';
    }
    return null;
  }

  static String? userName(String value, String maxLength) {
    if (value.length > int.parse(maxLength) || value.isEmpty) {
      return '1文字以上$maxLength文字以内で入力してください';
    }
    return null;
  }

  static String? userDesc(String value, String maxLength) {
    if (value.length > int.parse(maxLength)) {
      return '$maxLength文字以内で入力してください';
    }
    return null;
  }

  static String? moneyTitle(String value, String maxLength) {
    if (value.length > int.parse(maxLength) || value.isEmpty) {
      return '1文字以上$maxLength文字以内で入力してください';
    }
    return null;
  }

  static String? moneyAmount(String value) {
    if (value.isEmpty) {
      return '入力必須です';
    }
    try {
      int.parse(value);
    } on FormatException {
      return '数字のみを入力してください';
    }
    return null;
  }

  static String? moneyDate(String value) {
    return null;
  }

  static String? moneyMemo(String value, String maxLength) {
    if (value.length > int.parse(maxLength)) {
      return '$maxLength文字以内で入力してください';
    }
    return null;
  }

  static bool _validator(String value, String reg) {
    final RegExp regex = RegExp(reg);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }
}
