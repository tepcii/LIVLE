import 'package:flutter/material.dart';

class AppColor {
  static const Color primaryColor = Color(0xFFFF9800);
  static const Color signinButtonColor = Color(0xFFFF9800);
  static const Color registerButtonColor = Color(0xFFFF9800);
}

final Map<String, String> regs = <String, String>{
  'userId': r'^[a-zA-Z0-9_]+$',
};

class AppConfig {
  static const String APP_NAME = 'LIVLE';

  static const String TERMS_OF_SERVICE = '''
利用規約の
サンプルですよ〜〜
同意するなら
ボタンを押してねー






よろしく〜〜〜









ありがとう






こんにちは
''';

}