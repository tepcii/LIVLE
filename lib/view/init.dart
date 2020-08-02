import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:livle/view/common_parts/loading_indicator.dart';

class Initialize extends StatefulWidget {
  @override
  _InitializeState createState() => _InitializeState();
}

class _InitializeState extends State<Initialize> {
  @override
  void initState() {
    logout();
    FirebaseAuth.instance.currentUser().then((currentUser) {
      if (currentUser == null) {
        AwesomeDialog(
          context: context,
          headerAnimationLoop: false,
          dialogType: DialogType.NO_HEADER,
          title: '利用規約',
          desc: getTermsOfService(),
          dismissOnTouchOutside: false,
          btnOkText: "同意する",
          btnOkOnPress: () {
            Navigator.pushReplacementNamed(context, "/loginSelect");
          },
          btnOkIcon: Icons.check_circle,
        )..show();
      } else {
        print("uid:" + currentUser.uid);
        Navigator.pushReplacementNamed(context, "/home");
      }
    }).catchError((err) => print(err));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingIndicator(),
    );
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

}

String getTermsOfService() {
  return """
利用規約の
サンプルですよ〜〜
同意するなら
ボタンを押してねー






よろしく〜〜〜









ありがとう






こんにちは
  """;
}