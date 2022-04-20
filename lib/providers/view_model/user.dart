import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livle/providers/firebase_providers.dart';
import 'package:livle/repositories/user.dart';
import 'package:livle/services/auth_service.dart';

final ChangeNotifierProvider<UserViewModel> userViewModelNotifierProvider = ChangeNotifierProvider<UserViewModel>(
  (ChangeNotifierProviderRef<UserViewModel> ref) => UserViewModel(
    userRepository: ref.watch(originUserProvider),
    storage: ref.watch(firebaseStorageProvider),
  ),
);

class UserViewModel extends ChangeNotifier {
  UserViewModel({
    required OriginUserRepository userRepository,
    required FirebaseStorage storage,
  })  : _userRepository = userRepository,
        _storage = storage;

  final OriginUserRepository _userRepository;
  final FirebaseStorage _storage;

  OriginUserRepository get userRepository => _userRepository;

  ImageProvider<Object> iconImage = const AssetImage('images/default_user_icon.png');

  Future<void> downloadUserIcon() async {
    final AuthService _authService = AuthService();
    final String _uid = _authService.fetchCurrentUser()?.uid ?? '';
    final OriginUser _originUser = userRepository.originUser;
    if (_originUser.pickedImage) {
      final Reference _storageRef = _storage.ref().child('user_icons/$_uid.jpg');
      final String url = await _storageRef.getDownloadURL();
      iconImage = CachedNetworkImageProvider(url);
    }
    notifyListeners();
  }
}
