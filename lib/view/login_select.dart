import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:livle/config/config.dart';
import 'package:livle/services/auth_service.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginSelect extends StatelessWidget {
  const LoginSelect(this._appleSignInIsAvailable);

  final bool _appleSignInIsAvailable;

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
                  child: CardSlider(_appleSignInIsAvailable),
                ),
                const Text(
                  '© Copyright 2018-2020 Tenma Endou. All Rights Reserved.',
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
  late AnimationController _controller;
  late Animation<double> animation;
  late CurvedAnimation _curvedAnimation;
  final Tween<double> tween = Tween<double>(begin: 0.0, end: 1.0);

  @override
  void initState() {
    super.initState();
    // ロゴアニメーションの定義
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
    // アニメーションコントローラーの破棄
    _controller.dispose();
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
          margin: const EdgeInsets.only(top: 30),
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
  const CardSlider(this._appleSignInIsAvailable);

  final bool _appleSignInIsAvailable;

  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
          child: Card(
            elevation: 10,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            child: SignInButtons(_pageController, widget._appleSignInIsAvailable),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
          child: Card(
            elevation: 10,
            shape: const RoundedRectangleBorder(
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
  const SignInButtons(this._controller, this._appleSignInIsAvailable);

  final PageController _controller;
  final bool _appleSignInIsAvailable;

  @override
  _SignInButtonsState createState() => _SignInButtonsState();
}

class _SignInButtonsState extends State<SignInButtons> with TickerProviderStateMixin {
  final AuthService authService = AuthService();
  // ボタン押下時にロード中とわかるようにボタンを変形させるアニメーション
  final RoundedLoadingButtonController _twitterBtnController = RoundedLoadingButtonController();
  final RoundedLoadingButtonController _googleBtnController = RoundedLoadingButtonController();
  final RoundedLoadingButtonController _appleBtnController = RoundedLoadingButtonController();

  // すぐに別のボタンを押したときに処理が実行されないようにするためのフラグ
  late bool send;

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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RoundedLoadingButton(
            controller: _twitterBtnController,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: const Icon(
                      FontAwesomeIcons.twitter,
                    ),
                  ),
                  const Text(
                    'Twitter',
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            color: AppColor.signinButtonColor,
            onPressed: () => _onPressedTwitter(context),
          ),
          RoundedLoadingButton(
            controller: _googleBtnController,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: const Icon(
                      FontAwesomeIcons.google,
                    ),
                  ),
                  const Text(
                    'Google',
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            color: AppColor.signinButtonColor,
            onPressed: () => _onPressedGoogle(context),
          ),
          ElevatedButton(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: const Icon(
                      FontAwesomeIcons.envelope,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'E-mail',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: AppColor.signinButtonColor,
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              if (send) {
                return;
              }
              startSend();
              widget._controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              );
              finishSend();
            },
          ),
          // Apple Sign Inが使用可能ならばAppleログインボタンを表示
          if (widget._appleSignInIsAvailable)
            RoundedLoadingButton(
              controller: _appleBtnController,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: const Icon(
                        FontAwesomeIcons.apple,
                      ),
                    ),
                    const Text(
                      'Apple',
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              color: AppColor.signinButtonColor,
              onPressed: () => _onPressedApple(context),
            ),
          const Text(
            'ログイン方法を選んでください。',
          ),
        ],
      ),
    );
  }

  // Twitterボタンを押したときの処理
  Future<void> _onPressedTwitter(BuildContext context) async {
    if (send) {
      return;
    }
    startSend();
    final User? user = await authService.signInWithTwitter();
    if (user != null) {
      print('ログイン成功:' + user.uid);
      // await _twitterBtnController.success();
      // thenLogin(context, LoginLogic.Twitter);
    } else {
      print('ログイン失敗');
      showLoginFailedDialog('ネットワーク接続状況を確認してください。');
      _twitterBtnController.reset();
    }
    // finishSend();
  }

  // Googleボタンを押したときの処理
  Future<void> _onPressedGoogle(BuildContext context) async {
    if (send) {
      return;
    }
    startSend();
    final User? user = await authService.signInWithGoogle();
    if (user != null) {
      print('ログイン成功:' + user.uid);
      // thenLogin(context, LoginLogic.Google);
      _googleBtnController.success();
    } else {
      print('ログイン失敗');
      showLoginFailedDialog('ネットワーク接続状況を確認してください。');
      _googleBtnController.reset();
    }
    finishSend();
  }

  // Appleボタンを押したときの処理
  Future<void> _onPressedApple(BuildContext context) async {
    if (send) {
      return;
    }
    startSend();
    final User? user = await authService.signInWithApple();
    if (user != null) {
      print('ログイン成功:' + user.uid);
      // thenLogin(context, LoginLogic.Apple);
      _appleBtnController.success();
    } else {
      print('ログイン失敗');
      showLoginFailedDialog('ネットワーク接続状況を確認してください。');
      _appleBtnController.reset();
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
  const MailPassForm(this._controller);
  final PageController _controller;
  @override
  _MailPassFormState createState() => _MailPassFormState();
}

class _MailPassFormState extends State<MailPassForm> {
  final RoundedLoadingButtonController _loginButtonController = RoundedLoadingButtonController();
  final AuthService authService = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _mail = '';
  String _pass = '';
  bool _showPassword = false;

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
            margin: const EdgeInsets.only(left: 12, top: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(
                  FontAwesomeIcons.chevronLeft,
                  color: AppColor.primaryColor,
                ),
                onPressed: () {
                  widget._controller.previousPage(
                    duration: const Duration(milliseconds: 300),
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
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        icon: Icon(FontAwesomeIcons.envelope),
                        labelText: 'メールアドレス',
                        hintText: 'sample@example.com',
                        border: OutlineInputBorder(),
                      ),
                      validator: (String? value) => !EmailValidator.validate(value ?? '') ? '正しいメールアドレスを入力してください。' : null,
                      onChanged: _handleEmail,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      obscureText: !_showPassword,
                      decoration: InputDecoration(
                        icon: const Icon(FontAwesomeIcons.lock),
                        labelText: 'パスワード',
                        hintText: '',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: _showPassword
                              ? const Icon(
                                  FontAwesomeIcons.eye,
                                  color: Colors.green,
                                )
                              : const Icon(
                                  FontAwesomeIcons.eyeSlash,
                                  color: Colors.red,
                                ),
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                      ),
                      validator: (String? value) => value!.length < 6 ? '6文字以上に設定してください。' : null,
                      onChanged: _handlePass,
                    ),
                    RoundedLoadingButton(
                      controller: _loginButtonController,
                      child: const Text('ログイン'),
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

  Future<void> _loginWithEmail() async {
    if (_formKey.currentState?.validate() ?? false) {
      final bool result = await authService.signUpWithEmail(_mail, _pass, context);
      _loginButtonController.reset();
      if (result) {
        print('ログイン成功');
        // thenLogin(context, LoginLogic.Email);
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
Future<void> thenLogin(BuildContext context, LoginLogic loginLogic) async {
  Navigator.pushReplacementNamed(context, '/home');
}

void showLoginSuccessfulDialog(BuildContext context, bool userRegisteredFlg) {
  AwesomeDialog(
    context: context,
    headerAnimationLoop: false,
    dialogType: DialogType.SUCCES,
    animType: AnimType.SCALE,
    title: 'ログインしました！',
    desc: userRegisteredFlg ? '作成済みのユーザーが見つかりました。' : 'まずはユーザー情報を入力しましょう！',
    btnOkOnPress: () {},
  ).show();
}
