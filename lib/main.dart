import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livle/config/config.dart';
import 'package:livle/config/secret.dart';
import 'package:livle/view/components/tutorial/tutorial_slider_view.dart';
import 'package:livle/view/pages/register_money.dart';
import 'package:livle/view/user_checker.dart';

import 'view/auth_widget.dart';
import 'view/home.dart';
import 'view/login_select.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      // name: AppConfig.APP_NAME,
      options: FirebaseOptions(
        appId: Platform.isIOS ? IOS_APP_ID : ANDROID_APP_ID,
        messagingSenderId: FIREBASE_MESSAGING_SENDER_ID,
        apiKey: FIREBASE_API_KEY,
        projectId: FIREBASE_PROJECT_ID,
      ),
    );
  }
  const bool _appleSignInIsAvailable = false; //await AppleSignIn.isAvailable();

//  debugPaintSizeEnabled = true;
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]).then((_) {
    runApp(
      ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'LIVLE',
          theme: ThemeData(
            primaryColor: AppColor.primaryColor,
            hintColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: AuthWidget(
            signedInBuilder: (BuildContext context) => UserCheckerWidget(),
            nonSignedInBuilder: (BuildContext context) => const LoginSelect(_appleSignInIsAvailable),
          ),
          routes: <String, WidgetBuilder>{
            '/home': (BuildContext context) => Home(),
            '/loginSelect': (BuildContext context) => const LoginSelect(_appleSignInIsAvailable),
            '/tutorial': (BuildContext context) => const TutorialSliderView(),
            '/register_money': (BuildContext context) => const RegisterMoney(),
          },
        ),
      ),
    );
  });
}
