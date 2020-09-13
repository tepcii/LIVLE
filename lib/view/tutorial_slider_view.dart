import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:livle/models/user_model.dart';
import 'package:livle/services/auth_service.dart';
import 'package:livle/config/config.dart';
import 'package:livle/services/storage_service.dart';
import 'package:livle/view/form_parts/user_info_form.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class TutorialSliderView extends StatefulWidget {
  TutorialSliderView({Key key}) : super(key: key);

  @override
  _TutorialSliderViewState createState() => _TutorialSliderViewState();
}

class _TutorialSliderViewState extends State<TutorialSliderView> {


  @override
  Widget build(BuildContext context) {
    return OverBoard(
      skipText: "スキップ",
      nextText: "次へ",
      finishText: "",
      pages: [
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
        children: [
          Image.asset(
            'images/goat.png',
            width: 500,
            height: 300,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              "ライブルへようこそ！",
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
        children: [
          Image.asset(
            'images/giraffe.png',
            width: 500,
            height: 300,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              "まずはユーザー登録をしましょう！",
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

class _UserInfoInputPage extends StatefulWidget {
  @override
  __UserInfoInputPageState createState() => __UserInfoInputPageState();
}

class __UserInfoInputPageState extends State<_UserInfoInputPage> {

  AuthService authService;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController _userRegisterBtnController = new RoundedLoadingButtonController();
  bool connecting;
  final StateNotifierProvider<UserStateNotifier> userStateNotifier = StateNotifierProvider((ref) => UserStateNotifier());
  String _iconImagePath;
  String _userId;
  String _userName;
  String _userDesc;
  bool _pickedImage;

  @override
  void initState() {
    super.initState();
    _iconImagePath = "images/default_user_icon.png";
    _userId = "";
    _userName = "";
    _pickedImage = false;
  }

  // カメラロールから画像を選択後、正方形にトリミングして表示
  Future<String> pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final croppedImage = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: "トリミング",
          backgroundColor: AppColor.primaryColor,
        ),
        iosUiSettings: IOSUiSettings(
          title: "トリミング",
        ),
      );

      if (croppedImage != null) {
        File compressedImage = await FlutterImageCompress.compressAndGetFile(
          croppedImage.absolute.path,
          '${(await getTemporaryDirectory()).path}/${croppedImage.absolute.path}',
          minWidth: 300,
          minHeight: 300,
          quality: 50,
        );
        setState(() {
          _pickedImage = true;
          _iconImagePath = croppedImage.absolute.path;
        });
        Computed((read) {
          read(userStateNotifier.state).iconImagePath = croppedImage.absolute.path;
        });
        return croppedImage.absolute.path;
      } else {
        return "";
      }
    } else {
      return "";
    }
  }

  void onChangeUserId(String value) {
    setState(() {
      _userId = value;
    });
  }

  void onChangedUserName(String value) {
    setState(() {
      _userName = value;
    });
  }

  void onChangedUserDesc(String value) {
    setState(() {
      _userDesc = value;
    });
  }

  // 登録ボタン押下後の処理
  void _onPressedRegisterBtn(BuildContext context) async {
    // フォームバリデーション
    if (_formKey.currentState.validate()) {
      // ユーザー登録処理
      if (_pickedImage) {
        // 画像が選択されていればストレージに登録
        StorageTaskSnapshot snapshot = await StorageService.updateUserIcon(context, _iconImagePath);
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
        desc: "正しく入力してください。",
        btnOkOnPress: () {
          _userRegisterBtnController.reset();
        },
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
        key: _formKey,
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Consumer((context, read) {
              final userState = read(userStateNotifier.state);
              return ListView(
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: MediaQuery.of(context).size.width) * 0.07,
                    child: IconSelector(userState.iconImagePath, () async {
                      String pickedImagePath = await pickImage();
                      if (pickedImagePath != "") userState.iconImagePath = pickedImagePath;
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
                                onChanged: onChangeUserId,
                              ),
                              margin: EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                            ),
                            Container(
                              child: UserNameInput(
                                onChanged: onChangedUserName,
                              ),
                              margin: EdgeInsets.only(
                                bottom: 20,
                              ),
                            ),
                            Container(
                              child: UserDescTextField(
                                onChanged: onChangedUserDesc,
                              ),
                              margin: EdgeInsets.only(
                                bottom: 20,
                              ),
                            ),
                            RoundedLoadingButton(
                              controller: _userRegisterBtnController,
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "OK",
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              color: AppColor.registerButtonColor,
                              onPressed: () {
                                _onPressedRegisterBtn(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
