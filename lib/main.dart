import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:livle/config/config.dart';
import 'package:livle/storage/storage.dart';
import 'package:livle/view/tutorial_slider_view.dart';
import 'package:provider/provider.dart';

import 'view/home.dart';
import 'view/init.dart';
import 'view/login_select.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseStorage storage = await myFirebaseStorage();
//  debugPaintSizeEnabled = true;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(Provider<FirebaseStorage>.value(
      value: storage,
      child: MaterialApp(
        title: 'LIVLE',
        theme: ThemeData(
          primaryColor: AppColor.primaryColor,
          hintColor: Colors.white,
        ),
        home: Initialize(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => Home(),
          '/loginSelect': (BuildContext context) => LoginSelect(),
          '/tutorial': (BuildContext context) => TutorialSliderView(),
        },
      ),
    ));
  });
}
