import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_twitter/flutter_twitter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../config/secret.dart' as Secret;

enum LoginLogic {
  Twitter,
  Google,
  Email,
  Apple,
}

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // メールアドレスとパスワードを使ったサインアップ
  Future<Map> signUpWithEmail(String email, String password) async {
    Map authResult = new Map();
    authResult = {
      "resultUser": null,
      "isError": false,
      "errorMsg": null
    };
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      authResult["resultUser"] = await signInWithEmail(email, password);
    } catch (e) {
      print(e.code);
      if (e.code == "ERROR_EMAIL_ALREADY_IN_USE") {
        authResult = await signInWithEmail(email, password);
      } else {
        authResult["isError"] = true;
        authResult["errorMsg"] = e.code;
      }
    }

    return authResult;
  }

  // メールアドレスとパスワードを使ったサインイン
  Future<Map> signInWithEmail(String email, String password) async {
    Map authResult = new Map();
    authResult = {
      "resultUser": null,
      "isError": false,
      "errorMsg": null
    };
    try {
      authResult["resultUser"] = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      authResult["isError"] = true;
      authResult["errorMsg"] = e.code;
      print(e.code);
    }

    return authResult;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Twitter APIを通じてログイン情報を取得
  Future<User> signInWithTwitter() async {
    final TwitterLogin twitterLogin = TwitterLogin(
      consumerKey: Secret.TWITTER_CUNSUMER_KEY,
      consumerSecret: Secret.TWITTER_SECRET,
    );

    // Twitter認証の許可画面が出現
    final TwitterLoginResult result = await twitterLogin.authorize();

    if (result.session == null) {
      return null;
    }

    // Firebaseのユーザー情報に
    final AuthCredential credential = TwitterAuthProvider.getCredential(
      accessToken: result.session.token,
      secret: result.session.secret,
    );

    final User user = await fetchCurrentUserWithCredential(credential);
    final User currentUser = _auth.currentUser;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    assert(user.uid == currentUser.uid);

    return user;
  }

  // Googleアカウントでログイン
  Future<User> signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount googleCurrentUser = _googleSignIn.currentUser;
    if (googleCurrentUser == null) googleCurrentUser = await _googleSignIn.signInSilently(suppressErrors: true);
    if (googleCurrentUser == null) {
      await _googleSignIn.signIn();
      googleCurrentUser = _googleSignIn.currentUser;
    }

    if (googleCurrentUser != null) {
      GoogleSignInAuthentication googleAuth = await googleCurrentUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
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
    final AuthorizationResult appleResult = await AppleSignIn.performRequests([
      const AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);

    // TODO: appleResultがerrorしか返ってこない

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
  Future<FirebaseUser> fetchCurrentUserWithCredential(AuthCredential credential) async {
    return (await _auth.signInWithCredential(credential)).user;
  }

  // Firebaseからカレントユーザーを取得
  User fetchCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  // カレントユーザーのユーザー情報をCloud Firestoreから取得
  Future<List> fetchUserInfo() async {
    final User currentUser = FirebaseAuth.instance.currentUser;
    final _index = Platform.isIOS ? 0 : 1;
    final providerId = currentUser.providerData[_index].providerId;
    var userDoc;
    
    if (providerId == "password") {
      await Firestore.instance.collection("users").where("email_uid", isEqualTo: currentUser.uid).getDocuments().then((value) {
        userDoc = value.documents;
      });
    } else if (providerId == "twitter.com") {
      await Firestore.instance.collection("users").where("twitter_uid", isEqualTo: currentUser.uid).getDocuments().then((value) {
        userDoc = value.documents;
      });
    } else if (providerId == "google.com") {
      await Firestore.instance.collection("users").where("google_uid", isEqualTo: currentUser.uid).getDocuments().then((value) {
        userDoc = value.documents;
      });
    } else if (providerId == "apple.com") {
      await Firestore.instance.collection("users").where("apple_uid", isEqualTo: currentUser.uid).getDocuments().then((value) {
        userDoc = value.documents;
      });
    }

    return userDoc;

  }
}
