import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:livle/repositories/user.dart';

final ChangeNotifierProvider<UserRegisterViewModel> userRegisterViewModelNotifierProvider = ChangeNotifierProvider<UserRegisterViewModel>(
  (ProviderReference ref) => UserRegisterViewModel(
    userRepository: ref.read(originUserProvider),
  ),
);

class UserRegisterViewModel extends ChangeNotifier {
  UserRegisterViewModel({@required OriginUser userRepository}) : _originUser = userRepository;

  OriginUser _originUser;

  OriginUser get originUser => _originUser;

  void setUserInfoToLocalState(Map<String, dynamic> doc) {
    _originUser = _originUser.copyWith(
      name: doc['name'] as String,
      description: doc['description'] as String,
      id: doc['display_id'] as String,
      pickedImage: doc['pickedImage'] as bool,
      isBanned: doc['isBanned'] as bool,
      isOfficial: doc['isOfficial'] as bool,
    );
  }

  set originUser(OriginUser user) {
    _originUser = user;
    notifyListeners();
  }

  void changeId(String id) {
    _originUser = _originUser.copyWith(id: id);
    notifyListeners();
  }

  void changeName(String name) {
    _originUser = _originUser.copyWith(name: name);
    notifyListeners();
  }

  void changeDescription(String description) {
    _originUser = _originUser.copyWith(description: description);
    notifyListeners();
  }

  void changeIconImagePath(String iconImagePath) {
    _originUser = _originUser.copyWith(iconImagePath: iconImagePath, pickedImage: true);
    notifyListeners();
  }

  void toDefaultImage() {
    _originUser = _originUser.copyWith(iconImagePath: 'images/default_user_icon.png', pickedImage: false);
    notifyListeners();
  }
}
