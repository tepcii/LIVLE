import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:livle/services/storage_service.dart';
import 'package:state_notifier/state_notifier.dart';

class UserState {

  UserState({
    this.iconImagePath = 'images/default_user_icon.png',
    this.id = '',
    this.name = '',
    this.description = '',
  });

  String iconImagePath;
  String id;
  String name;
  String description;

}

class UserStateNotifier extends StateNotifier<UserState> {
  UserStateNotifier(): super(UserState());

  void updateUserInfo(String imagePath, String id, String name, String desc) {
    state.iconImagePath = imagePath;
    state.id = id;
    state.name = name;
    state.description = desc;
  }

  void updateUserIcon(String imagePath) {
    state.iconImagePath = imagePath;
  }

  void registerUserInfoToFireStore(BuildContext context, String _iconImagePath) async {
    StorageTaskSnapshot snapshot = await StorageService.updateUserIcon(context, _iconImagePath);
  }

}