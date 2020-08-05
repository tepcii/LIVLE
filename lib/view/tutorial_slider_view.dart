import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:livle/services/auth_service.dart';
import 'package:livle/config/config.dart';
import 'package:livle/services/storage_service.dart';
import 'package:livle/view/form_parts/user_info_form.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
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
            'images/LogoMark.png',
            width: 200,
            height: 200,
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
            'images/LogoMark.png',
            width: 200,
            height: 200,
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

  void pickImage() async {
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
      }
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

  void _onPressedRegisterBtn(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      if (_pickedImage) {
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
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                Center(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: 110.0,
                        height: 110.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(_iconImagePath),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: pickImage,
                          child: Container(
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(99.0),
                              color: AppColor.primaryColor,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(99.0),
                                color: Colors.blue,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  FontAwesomeIcons.pen,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
            ),
          ),
        ),
      ),
    );
  }
}
