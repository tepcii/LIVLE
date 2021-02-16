import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:livle/repositories/user.dart';

final ChangeNotifierProvider<UserRegisterViewModel> userRegisterViewModelNotifierProvider = ChangeNotifierProvider<UserRegisterViewModel>(
  (ProviderReference ref) => UserRegisterViewModel(
    userRepository: ref.read(originUserProvider),
  ),
);

class UserRegisterViewModel extends ChangeNotifier {
  UserRegisterViewModel({@required OriginUserRepository userRepository}) : _userRepository = userRepository;

  OriginUserRepository _userRepository;

  OriginUserRepository get userRepository => _userRepository;

  void setUserInfoToLocalState(Map<String, dynamic> doc) {
    _userRepository.originUser = _userRepository.originUser.copyWith(
      name: doc['name'] as String,
      description: doc['description'] as String,
      id: doc['display_id'] as String,
      pickedImage: doc['pickedImage'] as bool,
      isBanned: doc['isBanned'] as bool,
      isOfficial: doc['isOfficial'] as bool,
    );
  }

  set userRepository(OriginUserRepository user) {
    _userRepository = user;
    notifyListeners();
  }

  void changeId(String id) {
    _userRepository.originUser = _userRepository.originUser.copyWith(id: id);
    notifyListeners();
  }

  void changeName(String name) {
    _userRepository.originUser = _userRepository.originUser.copyWith(name: name);
    notifyListeners();
  }

  void changeDescription(String description) {
    _userRepository.originUser = _userRepository.originUser.copyWith(description: description);
    notifyListeners();
  }

  void changeIconImagePath(String iconImagePath) {
    _userRepository.originUser = _userRepository.originUser.copyWith(iconImagePath: iconImagePath, pickedImage: true);
    notifyListeners();
  }

  void toDefaultImage() {
    _userRepository.originUser = _userRepository.originUser.copyWith(iconImagePath: 'images/default_user_icon.png', pickedImage: false);
    notifyListeners();
  }
}
