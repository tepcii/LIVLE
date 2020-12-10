import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_twitter/flutter_twitter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:livle/providers/user_register_view_provider.dart';

import '../config/secret.dart' as secret;

enum LoginLogic {
  Twitter,
  Google,
  Email,
  Apple,
}

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // メールアドレスとパスワードを使ったサインアップ
  Future<bool> signUpWithEmail(String email, String password, BuildContext context) async {
    try {
      // ユーザーを作成
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await signInWithEmail(email, password);
    } catch (e) {
      print(e.code);
      switch (e.code.toString()) {
        // ユーザー作成時にメールアドレス使用済みエラーが出る場合、そのままログイン
        case 'ERROR_EMAIL_ALREADY_IN_USE':
          final bool _signInResult = await signInWithEmail(email, password);
          if (_signInResult) {
            return true;
          }
          break;

        // パスワードが違うエラー
        case 'ERROR_WRONG_PASSWORD':
          AwesomeDialog(
            context: context,
            headerAnimationLoop: false,
            dialogType: DialogType.ERROR,
            animType: AnimType.SCALE,
            title: 'ログイン失敗',
            desc: 'パスワードが間違っています。',
            btnOkOnPress: () {},
          ).show();
          break;

        default:
          AwesomeDialog(
            context: context,
            headerAnimationLoop: false,
            dialogType: DialogType.ERROR,
            animType: AnimType.SCALE,
            title: 'ログイン失敗',
            desc: '何らかの問題でログインに失敗しました。',
            btnOkOnPress: () {},
          ).show();
          break;
      }
      return false;
    }

    return true;
  }

  // メールアドレスとパスワードを使ったサインイン
  Future<bool> signInWithEmail(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      return false;
    }

    return true;
  }

  // Twitter APIを通じてログイン情報を取得
  Future<User> signInWithTwitter() async {
    final TwitterLogin twitterLogin = TwitterLogin(
      consumerKey: secret.TWITTER_CUNSUMER_KEY,
      consumerSecret: secret.TWITTER_SECRET,
    );

    // Twitter認証の許可画面が出現
    final TwitterLoginResult result = await twitterLogin.authorize();

    if (result.session == null) {
      return null;
    }

    // Firebaseのユーザー情報に
    final AuthCredential credential = TwitterAuthProvider.credential(
      accessToken: result.session.token,
      secret: result.session.secret,
    );

    final User user = await fetchCurrentUserWithCredential(credential);
    final User currentUser = _firebaseAuth.currentUser;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    assert(user.uid == currentUser.uid);

    return user;
  }

  // Googleアカウントでログイン
  Future<User> signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount googleCurrentUser = _googleSignIn.currentUser;
    googleCurrentUser ??= await _googleSignIn.signInSilently(suppressErrors: true);
    if (googleCurrentUser == null) {
      await _googleSignIn.signIn();
      googleCurrentUser = _googleSignIn.currentUser;
    }

    if (googleCurrentUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleCurrentUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      final User user = await fetchCurrentUserWithCredential(credential);
      return user;
    } else {
      return null;
    }
  }

  // Appleアカウントでログイン
  Future<User> signInWithApple() async {
    // 証明書をリクエストして取得
    final AuthorizationResult appleResult = await AppleSignIn.performRequests(<AppleIdRequest>[
      const AppleIdRequest(requestedScopes: <Scope>[Scope.email, Scope.fullName])
    ]);

    // TODO(Tenma): appleResultがerrorしか返ってこない

    print(appleResult.status);
    print(appleResult.credential);
    print(appleResult.error);

    switch (appleResult.status) {
      case AuthorizationStatus.authorized:
        final AuthCredential credential = OAuthProvider('apple.com').credential(
          accessToken: String.fromCharCodes(appleResult.credential.authorizationCode),
          idToken: String.fromCharCodes(appleResult.credential.identityToken),
        );
        return await fetchCurrentUserWithCredential(credential);

      case AuthorizationStatus.error:
      case AuthorizationStatus.cancelled:
      default:
        return null;
    }
  }

  // Firebaseからカレントユーザーを取得
  Future<User> fetchCurrentUserWithCredential(AuthCredential credential) async {
    return (await _firebaseAuth.signInWithCredential(credential)).user;
  }

  // Firebaseからカレントユーザーを取得
  User fetchCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // カレントユーザーのユーザー情報をCloud Firestoreから取得
  Future<bool> fetchUserInfo(UserRegisterViewModel userState) async {
    final User currentUser = _firebaseAuth.currentUser;
    // final int _index = Platform.isIOS ? 0 : 1;
    // final String providerId = currentUser.providerData[_index].providerId;
    Map<String, dynamic> userDoc;
    bool exists;

    // if (providerId == 'password') {
    //   await FirebaseFirestore.instance.collection('users').where('email_uid', isEqualTo: currentUser.uid).get().then((QuerySnapshot value) {
    //     userDoc = value.docs;
    //   });
    // } else if (providerId == 'twitter.com') {
    //   await FirebaseFirestore.instance.collection('users').where('twitter_uid', isEqualTo: currentUser.uid).get().then((QuerySnapshot value) {
    //     userDoc = value.docs;
    //   });
    // } else if (providerId == 'google.com') {
    //   await FirebaseFirestore.instance.collection('users').where('google_uid', isEqualTo: currentUser.uid).get().then((QuerySnapshot value) {
    //     userDoc = value.docs;
    //   });
    // } else if (providerId == 'apple.com') {
    //   await FirebaseFirestore.instance.collection('users').where('apple_uid', isEqualTo: currentUser.uid).get().then((QuerySnapshot value) {
    //     userDoc = value.docs;
    //   });
    // }

    await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).get().then((DocumentSnapshot value) {
      if (value.exists) {
        userDoc = value.data();
        setUserInfoToLocalState(userState, userDoc);
        exists = true;
      } else {
        exists = false;
      }
    });

    return exists;
  }

  void setUserInfoToLocalState(UserRegisterViewModel userState, Map<String, dynamic> doc) {
    userState.originUser = userState.originUser.copyWith(
      name: '名前',
    );
  }
}
