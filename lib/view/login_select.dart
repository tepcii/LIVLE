import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:livle/services/auth_service.dart';
import 'package:livle/config/config.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginSelect extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo(),
                Container(
                  height: 350,
                  width: 360,
                  child: CardSlider(),
                ),
                Text(
                  "© Copyright 2018-2020 Tenma Endou. All Rights Reserved.",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  CurvedAnimation _curvedAnimation;
  final tween = Tween(begin: 0.0, end: 1.0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    animation = tween.animate(_controller);
    _curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.ease);
    _controller.repeat();
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller.dispose();
      _controller = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RotationTransition(
          turns: _curvedAnimation,
          child: Image.asset(
            'images/LogoMark.png',
            width: 150,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          child: Image.asset(
            'images/LogoType.png',
            width: 150,
          ),
        ),
      ],
    );
  }
}

class CardSlider extends StatefulWidget {
  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            child: SignInButtons(_pageController),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            child: MailPassForm(_pageController),
          ),
        ),
      ],
    );
  }
}

class SignInButtons extends StatefulWidget {
  final PageController _controller;
  SignInButtons(this._controller);
  @override
  _SignInButtonsState createState() => _SignInButtonsState();
}

class _SignInButtonsState extends State<SignInButtons>
    with TickerProviderStateMixin {
  final AuthService authService = AuthService();
  final RoundedLoadingButtonController _twitterBtnController =
      new RoundedLoadingButtonController();
  final RoundedLoadingButtonController _googleBtnController =
      new RoundedLoadingButtonController();

  bool send;

  @override
  void initState() {
    super.initState();
    send = false;
  }

  void startSend() => setState(() => send = true);
  void finishSend() => setState(() => send = false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RoundedLoadingButton(
            controller: _twitterBtnController,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Icon(
                      FontAwesomeIcons.twitter,
                    ),
                  ),
                  Text(
                    "Twitter",
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            color: AppColor.signinButtonColor,
            onPressed: _onPressedTwitter,
          ),
          RoundedLoadingButton(
            controller: _googleBtnController,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Icon(
                      FontAwesomeIcons.google,
                    ),
                  ),
                  Text(
                    "Google",
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            color: AppColor.signinButtonColor,
            onPressed: _onPressedGoogle,
          ),
          RaisedButton(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Icon(
                      FontAwesomeIcons.envelope,
                    ),
                  ),
                  Text(
                    "E-mail",
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            color: AppColor.signinButtonColor,
            shape: StadiumBorder(),
            onPressed: () {
              if (send) return;
              startSend();
              widget._controller.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.linear,
              );
              finishSend();
            },
          ),
          Text(
            "ログイン方法を選んでください。",
          ),
        ],
      ),
    );
  }

  void _onPressedTwitter() async {
    if (send) return;
    startSend();
    final user = await authService.signInWithTwitter();
    if (user != null) {
      print("ログイン成功:" + user.uid);
      _twitterBtnController.success();
      thenLogin(context, LoginLogic.Twitter, user.uid);
    } else {
      print("ログイン失敗");
      showLoginFailedDialog('ネットワーク環境などを確認してください。');
      _twitterBtnController.reset();
    }
    finishSend();
  }

  void _onPressedGoogle() async {
    if (send) return;
    startSend();
    final user = await authService.signInWithGoogle();
    if (user != null) {
      print("ログイン成功:" + user.uid);
      thenLogin(context, LoginLogic.Google, user.uid);
      _googleBtnController.success();
    } else {
      print("ログイン失敗");
      showLoginFailedDialog('ネットワーク環境などを確認してください。');
      _googleBtnController.reset();
    }
    finishSend();
  }

  void showLoginFailedDialog(String msg) {
    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      dialogType: DialogType.ERROR,
      animType: AnimType.SCALE,
      title: 'ログイン失敗',
      desc: msg,
      btnOkOnPress: () {},
    ).show();
  }

}

class MailPassForm extends StatefulWidget {
  MailPassForm(this._controller);
  final PageController _controller;
  @override
  _MailPassFormState createState() => _MailPassFormState();
}

class _MailPassFormState extends State<MailPassForm> {
  final RoundedLoadingButtonController _loginButtonController =
      RoundedLoadingButtonController();
  final AuthService authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  String _mail;
  String _pass;
  bool _showPassword ;

  @override
  void initState() {
    super.initState();
    _mail = "";
    _pass = "";
    _showPassword = false;
  }

  void _handleEmail(String value) {
    setState(() {
      _mail = value;
    });
  }

  void _handlePass(String value) {
    setState(() {
      _pass = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 12, top: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.chevronLeft,
                  color: AppColor.primaryColor,
                ),
                onPressed: () {
                  widget._controller.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TextFormField(
                      autovalidate: true,
                      decoration: const InputDecoration(
                        icon: Icon(FontAwesomeIcons.envelope),
                        labelText: "メールアドレス",
                        hintText: "sample@example.com",
                        border: OutlineInputBorder(),
                      ),
                      validator: (String value) {
                        return (!EmailValidator.validate(value)
                            ? "正しいメールアドレスを入力してください。"
                            : null);
                      },
                      onChanged: _handleEmail,
                    ),
                    TextFormField(
                      autovalidate: true,
                      obscureText: !_showPassword,
                      decoration: InputDecoration(
                        icon: Icon(FontAwesomeIcons.lock),
                        labelText: "パスワード",
                        hintText: "",
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: _showPassword
                              ? Icon(FontAwesomeIcons.eye, color: Colors.green,)
                              : Icon(FontAwesomeIcons.eyeSlash, color: Colors.red,),
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                      ),
                      validator: (String value) {
                        return (value.length < 6
                            ? "6文字以上に設定してください。"
                            : null);
                      },
                      onChanged: _handlePass,
                    ),
                    RoundedLoadingButton(
                      controller: _loginButtonController,
                      child: Text("ログイン"),
                      onPressed: _loginWithEmail,
                      color: AppColor.signinButtonColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _loginWithEmail() async {
    if (_formKey.currentState.validate()) {
      Map result = await authService.signUpWithEmail(_mail, _pass);
      _loginButtonController.reset();
      if (result["isError"] == false) {
        print("ログイン成功");
        thenLogin(context, LoginLogic.Email, result["resultUser"].user.uid);
      } else {
        switch (result["errorMsg"]) {
          case "ERROR_WRONG_PASSWORD":
            showLoginFailedDialog("パスワードが間違っています。");
            break;
          default:
            showLoginFailedDialog("何らかの問題でログインに失敗しました。");
            break;
        }
      }
    }
  }

  void showLoginFailedDialog(String msg) {
    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      dialogType: DialogType.ERROR,
      animType: AnimType.SCALE,
      title: 'ログイン失敗',
      desc: msg,
      btnOkOnPress: () {},
    ).show();
  }

}

// ログイン後、ホーム画面に遷移
void thenLogin(BuildContext context, LoginLogic loginLogic, String uid) async {
  Navigator.pushReplacementNamed(context, "/home");
}

void showLoginSuccessfulDialog(BuildContext context, bool userRegisteredFlg) {
  AwesomeDialog(
    context: context,
    headerAnimationLoop: false,
    dialogType: DialogType.SUCCES,
    animType: AnimType.SCALE,
    title: 'ログインしました！',
    desc: userRegisteredFlg ? "作成済みのユーザーが見つかりました。" : "まずはユーザー情報を入力しましょう！",
    btnOkOnPress: () {},
  ).show();
}