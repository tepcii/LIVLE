import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livle/config/config.dart';
import 'package:livle/providers/user_register_view_provider.dart';
import 'package:livle/view/components/form_parts/user_info_form.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class TutorialSliderView extends StatefulWidget {
  const TutorialSliderView({Key key}) : super(key: key);

  @override
  _TutorialSliderViewState createState() => _TutorialSliderViewState();
}

class _TutorialSliderViewState extends State<TutorialSliderView> {
  @override
  Widget build(BuildContext context) {
    return OverBoard(
      skipText: 'スキップ',
      nextText: '次へ',
      finishText: '',
      pages: <PageModel>[
        PageModel.withChild(
          color: AppColor.primaryColor,
          child: _WelcomePage(),
          doAnimateChild: false,
        ),
        PageModel.withChild(
          color: AppColor.primaryColor,
          child: _DescriptionPage(),
          doAnimateChild: false,
        ),
        PageModel.withChild(
          color: AppColor.primaryColor,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: _UserInfoInputPage(),
          ),
          doAnimateChild: false,
        ),
      ],
      finishCallback: () {
//        _onPressedRegisterBtn(context);
      },
    );
  }
}

class _WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
      Image.asset(
        'images/goat.png',
        width: 500,
        height: 300,
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: Text(
          'ライブルへようこそ！',
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      ),
    ]);
  }
}

class _DescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
      Image.asset(
        'images/giraffe.png',
        width: 500,
        height: 300,
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: Text(
          'まずはユーザー登録をしましょう！',
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    ]);
  }
}

class _UserInfoInputPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final UserRegisterViewModel _userRegisterViewModel = watch(userRegisterViewModelNotifierProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
        key: _userRegisterViewModel.formKey,
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: MediaQuery.of(context).size.width) * 0.07,
                  child: IconSelector(_userRegisterViewModel.originUserForRegister.iconImagePath, () async {
                    await _userRegisterViewModel.pickImage();
                    // if (pickedImagePath != '') {
                    //   userState.iconImagePath = pickedImagePath;
                    // }
                  }),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 17,
                        left: 17,
                        right: 17,
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: UserIdInput(
                              onChanged: (String value) => _userRegisterViewModel.changeId(value),
                            ),
                            margin: const EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                          ),
                          Container(
                            child: UserNameInput(
                              onChanged: (String value) => _userRegisterViewModel.changeName(value),
                            ),
                            margin: const EdgeInsets.only(
                              bottom: 20,
                            ),
                          ),
                          Container(
                            child: UserDescTextField(
                              onChanged: (String value) => _userRegisterViewModel.changeDescription(value),
                            ),
                            margin: const EdgeInsets.only(
                              bottom: 20,
                            ),
                          ),
                          RoundedLoadingButton(
                            controller: _userRegisterViewModel.userRegisterBtnController,
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            color: AppColor.registerButtonColor,
                            onPressed: () => _userRegisterViewModel.onPressedRegisterBtn(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
