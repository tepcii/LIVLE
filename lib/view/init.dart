import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:livle/view/common_parts/loading_indicator.dart';
import 'package:livle/view/home.dart';

class Initialize extends StatefulWidget {
  @override
  _InitializeState createState() => _InitializeState();
}

class _InitializeState extends State<Initialize> {
  @override
  void initState() {
    logout();
//    FirebaseAuth.instance.currentUser().then((currentUser) {
//      if (currentUser == null) {
//        AwesomeDialog(
//          context: context,
//          headerAnimationLoop: false,
//          dialogType: DialogType.NO_HEADER,
//          title: '利用規約',
//          desc: getTermsOfService(),
//          dismissOnTouchOutside: false,
//          btnOkText: "同意する",
//          btnOkOnPress: () async {
//            // Apple Sign Inが使用可能かどうかを判定
//            bool _appleSignInIsAvailable = await AppleSignIn.isAvailable();
//            Navigator.pushReplacementNamed(context, "/loginSelect", arguments: _appleSignInIsAvailable);
//          },
//          btnOkIcon: Icons.check_circle,
//        )..show();
//      } else {
//        print("uid:" + currentUser.uid);
//        Navigator.pushReplacementNamed(context, "/home");
//      }
//    }).catchError((err) => print(err));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          User user = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (user == null) {
                AwesomeDialog(
                  context: context,
                  headerAnimationLoop: false,
                  dialogType: DialogType.NO_HEADER,
                  title: '利用規約',
                  desc: getTermsOfService(),
                  dismissOnTouchOutside: false,
                  btnOkText: "同意する",
                  btnOkOnPress: () async {
                    // Apple Sign Inが使用可能かどうかを判定
                    bool _appleSignInIsAvailable = await AppleSignIn.isAvailable();
                    Navigator.pushReplacementNamed(context, "/loginSelect", arguments: _appleSignInIsAvailable);
                  },
                  btnOkIcon: Icons.check_circle,
                )..show();
                // ローディングインジケーター
                return LoadingIndicator();
              }
              return Home();
            default:
              // ローディングインジケーター
              return LoadingIndicator();
          }
        },
      ),
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