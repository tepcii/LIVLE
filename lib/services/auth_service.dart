import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_twitter/flutter_twitter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../config/secret.dart' as Secret;

enum LoginLogic {
  Twitter,
  Google,
  Email,
}

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
  Future<FirebaseUser> signInWithTwitter() async {
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
      authToken: result.session.token,
      authTokenSecret: result.session.secret,
    );

    final FirebaseUser user = await fetchCurrentUserWithCredential(credential);
    final FirebaseUser currentUser = await _auth.currentUser();

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    assert(user.uid == currentUser.uid);

    return user;
  }

  // Googleアカウントでログイン
  Future<FirebaseUser> signInWithGoogle() async {
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
      final FirebaseUser user = await fetchCurrentUserWithCredential(credential);
      return user;
    } else {
      return null;
    }

  }

  // Firebaseからカレントユーザーを取得
  Future<FirebaseUser> fetchCurrentUserWithCredential(AuthCredential credential) async {
    return (await _auth.signInWithCredential(credential)).user;
  }

  // Firebaseからカレントユーザーを取得
  Future<FirebaseUser> fetchCurrentUser() async {
    return await _auth.currentUser();
  }

  // カレントユーザーのユーザー情報をCloud Firestoreから取得
  Future<List> fetchUserInfo() async {
    final FirebaseUser currentUser = await _auth.currentUser();
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
    }

    return userDoc;

  }
}
