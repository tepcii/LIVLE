import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:livle/config/config.dart';
import 'package:livle/providers/user_register_view_provider.dart';
import 'package:livle/services/storage_service.dart';
import 'package:livle/view/form_parts/user_info_form.dart';
import 'package:path_provider/path_provider.dart';
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
          child: _UserInfoInputPage(),
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
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
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
        ]
    );
  }
}

class _DescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
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
        ]
    );
  }
}

class _UserInfoInputPage extends ConsumerWidget {
  final ImagePicker picker = ImagePicker();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController _userRegisterBtnController = RoundedLoadingButtonController();
  // bool connecting;
  // String _iconImagePath = 'images/default_user_icon.png';
  // String _userId = '';
  // String _userName = '';
  // String _userDesc = '';
  // bool _pickedImage = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _iconImagePath = "images/default_user_icon.png";
  //   _userId = "";
  //   _userName = "";
  //   _pickedImage = false;
  // }

  // カメラロールから画像を選択後、正方形にトリミングして表示
  Future<String> pickImage(UserRegisterViewModel userState) async {
    final PickedFile pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final File croppedImage = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatioPresets: <CropAspectRatioPreset>[
          CropAspectRatioPreset.square,
        ],
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        androidUiSettings: const AndroidUiSettings(
          toolbarTitle: 'トリミング',
          backgroundColor: AppColor.primaryColor,
        ),
        iosUiSettings: const IOSUiSettings(
          title: 'トリミング',
        ),
      );

      if (croppedImage != null) {
        await FlutterImageCompress.compressAndGetFile(
          croppedImage.absolute.path,
          '${(await getTemporaryDirectory()).path}/${croppedImage.absolute.path}',
          minWidth: 300,
          minHeight: 300,
          quality: 50,
        );
        userState.changeIconImagePath(croppedImage.absolute.path);
        return croppedImage.absolute.path;
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  void onChangeUserId(String value, ScopedReader watch) {
    final UserRegisterViewModel _provider = watch(userRegisterViewModelNotifierProvider);
    _provider.changeId(value);
  }

  void onChangedUserName(String value, ScopedReader watch) {
    final UserRegisterViewModel _provider = watch(userRegisterViewModelNotifierProvider);
    _provider.changeName(value);
  }

  void onChangedUserDesc(String value, ScopedReader watch) {
    final UserRegisterViewModel _provider = watch(userRegisterViewModelNotifierProvider);
    _provider.changeDescription(value);
  }

  // 登録ボタン押下後の処理
  Future<void> _onPressedRegisterBtn(BuildContext context, UserRegisterViewModel userState) async {
    // フォームバリデーション
    if (_formKey.currentState.validate()) {
      // ユーザー登録処理
      if (userState.originUser.pickedImage) {
        // 画像が選択されていればストレージに登録
        final StorageTaskSnapshot snapshot = await StorageService.updateUserIcon(context, userState.originUser.iconImagePath);
        if (snapshot.error == null) {
          _userRegisterBtnController.success();
          print(await snapshot.ref.getDownloadURL());
        } else {
          _userRegisterBtnController.error();
          print('Something goes wrong');
        }
      }

    } else {
      _userRegisterBtnController.error();
      AwesomeDialog(
        context: context,
        headerAnimationLoop: false,
        dialogType: DialogType.ERROR,
        animType: AnimType.SCALE,
        title: '入力エラー',
        desc: '正しく入力してください。',
        btnOkOnPress: () {
          _userRegisterBtnController.reset();
        },
      ).show();
    }
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final UserRegisterViewModel userState = watch(userRegisterViewModelNotifierProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
        key: _formKey,
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
                  child: IconSelector(userState.originUser.iconImagePath, () async {
                    await pickImage(userState);
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
                      padding: const EdgeInsets.only(bottom: 17, left: 17, right: 17,),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: UserIdInput(
                              onChanged: (String value) => onChangeUserId(value, watch),
                            ),
                            margin: const EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                          ),
                          Container(
                            child: UserNameInput(
                              onChanged: onChangedUserName,
                            ),
                            margin: const EdgeInsets.only(
                              bottom: 20,
                            ),
                          ),
                          Container(
                            child: UserDescTextField(
                              onChanged: onChangedUserDesc,
                            ),
                            margin: const EdgeInsets.only(
                              bottom: 20,
                            ),
                          ),
                          RoundedLoadingButton(
                            controller: _userRegisterBtnController,
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
                            onPressed: () {
                              _onPressedRegisterBtn(context, userState);
                            },
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