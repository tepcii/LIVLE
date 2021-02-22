import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:livle/config/config.dart';
import 'package:livle/repositories/artist_list.dart';
import 'package:livle/repositories/money_list.dart';
import 'package:livle/repositories/schedule_list.dart';
import 'package:livle/repositories/user.dart';
import 'package:livle/view/components/tutorial/confirm.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

final ChangeNotifierProvider<UserRegisterViewModel> userRegisterViewModelNotifierProvider = ChangeNotifierProvider<UserRegisterViewModel>(
  (ProviderReference ref) => UserRegisterViewModel(
    userRepository: ref.watch(originUserProvider),
    artistRepository: ref.watch(artistsRepositoryProvider),
    moneyRepository: ref.watch(moneyRepositoryProvider),
    scheduleRepository: ref.watch(scheduleRepositoryProvider),
  ),
);

class UserRegisterViewModel extends ChangeNotifier {
  UserRegisterViewModel({
    @required OriginUserRepository userRepository,
    @required ArtistRepository artistRepository,
    @required MoneyRepository moneyRepository,
    @required ScheduleRepository scheduleRepository,
  })  : _userRepository = userRepository,
        _artistRepository = artistRepository,
        _moneyRepository = moneyRepository,
        _scheduleRepository = scheduleRepository;

  final OriginUserRepository _userRepository;
  final ArtistRepository _artistRepository;
  final MoneyRepository _moneyRepository;
  final ScheduleRepository _scheduleRepository;

  OriginUserRepository get userRepository => _userRepository;
  ArtistRepository get artistRepository => _artistRepository;
  MoneyRepository get moneyRepository => _moneyRepository;
  ScheduleRepository get scheduleRepository => _scheduleRepository;
  OriginUser get originUserForRegister => _originUserForRegister;

  OriginUser _originUserForRegister = const OriginUser(
    id: '',
    name: 'null',
  );

  final ImagePicker picker = ImagePicker();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController userRegisterBtnController = RoundedLoadingButtonController();

  // カメラロールから画像を選択後、正方形にトリミングして表示
  Future<String> pickImage() async {
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
        changeIconImagePath(croppedImage.absolute.path);
        return croppedImage.absolute.path;
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  // 登録ボタン押下後の処理
  Future<void> onPressedRegisterBtn(BuildContext context) async {
    // フォームバリデーション
    if (formKey.currentState.validate()) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.NO_HEADER,
        body: const ConfirmDialog(),
        btnCancelText: 'いいえ',
        btnCancelOnPress: () => userRegisterBtnController.reset(),
        btnOkText: 'はい',
        btnOkOnPress: () async {
          await _userRepository.source.registerUser(_originUserForRegister).then((bool value) async {
            if (value) {
              await _artistRepository.source.init();
              await _moneyRepository.source.init();
              await _scheduleRepository.source.init();
              // userRegisterBtnController.success();
              Navigator.pushReplacementNamed(context, '/home');
            } else {
              userRegisterBtnController.error();
            }
          });
        },
      ).show();
    } else {
      userRegisterBtnController.error();
      AwesomeDialog(
        context: context,
        headerAnimationLoop: false,
        dialogType: DialogType.ERROR,
        animType: AnimType.SCALE,
        title: '入力エラー',
        desc: '正しく入力してください。',
        btnOkOnPress: () {
          userRegisterBtnController.reset();
        },
      ).show();
    }
  }

  void setUserInfoToLocalState(Map<String, dynamic> doc) {
    if (doc != null) {
      _userRepository.originUser = _userRepository.originUser.copyWith(
        name: doc['name'] as String,
        description: doc['description'] as String,
        id: doc['display_id'] as String,
        pickedImage: doc['pickedImage'] as bool,
        isBanned: doc['isBanned'] as bool,
        isOfficial: doc['isOfficial'] as bool,
      );
    }
  }

  void changeId(String id) {
    _originUserForRegister = _originUserForRegister.copyWith(id: id);
    notifyListeners();
  }

  void changeName(String name) {
    _originUserForRegister = _originUserForRegister.copyWith(name: name);
    notifyListeners();
  }

  void changeDescription(String description) {
    _originUserForRegister = _originUserForRegister.copyWith(description: description);
    notifyListeners();
  }

  void changeIconImagePath(String iconImagePath) {
    _originUserForRegister = _originUserForRegister.copyWith(iconImagePath: iconImagePath, pickedImage: true);
    notifyListeners();
  }

  void toDefaultImage() {
    _originUserForRegister = _originUserForRegister.copyWith(iconImagePath: 'images/default_user_icon.png', pickedImage: false);
    notifyListeners();
  }
}
