import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:livle/config/config.dart';
import 'package:livle/storage/storage.dart';
import 'package:livle/view/tutorial_slider_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;

import 'view/home.dart';
import 'view/init.dart';
import 'view/login_select.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final FirebaseStorage storage = await myFirebaseStorage();
  bool _appleSignInIsAvailable = await AppleSignIn.isAvailable();

//  debugPaintSizeEnabled = true;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(Provider<FirebaseStorage>.value(
      value: storage,
      child: ProviderScope(
        child: MaterialApp(
          title: 'LIVLE',
          theme: ThemeData(
            primaryColor: AppColor.primaryColor,
            hintColor: Colors.white,
          ),
          home: Initialize(),
          routes: <String, WidgetBuilder>{
            '/home': (BuildContext context) => Home(),
            '/loginSelect': (BuildContext context) => LoginSelect(_appleSignInIsAvailable),
            '/tutorial': (BuildContext context) => TutorialSliderView(),
          },
        ),
      ),
    ));
  });
}
