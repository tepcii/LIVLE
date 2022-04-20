import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:livle/providers/firebase_providers.dart';
import 'package:livle/source/interfaces/user.dart';
import 'package:livle/source/user.dart';

part 'user.freezed.dart';

class OriginUserRepository extends ChangeNotifier {
  OriginUserRepository({
    required this.source,
    required OriginUser originUser,
  }) : _originUser = originUser;

  IUserDataSource source;
  OriginUser _originUser;

  OriginUser get originUser => _originUser;
  set originUser(OriginUser value) {
    _originUser = value;
    notifyListeners();
  }
}

@freezed
abstract class OriginUser with _$OriginUser {
  const factory OriginUser({
    required String id,
    required String name,
    @Default('') String description,
    @Default('images/default_user_icon.png') String iconImagePath,
    @Default(false) bool pickedImage,
    @Default(false) bool isBanned,
    @Default(false) bool isOfficial,
  }) = _OriginUser;
}

final Provider<OriginUserRepository> originUserProvider = Provider<OriginUserRepository>(
  (ProviderRef<OriginUserRepository> ref) => OriginUserRepository(
    source: UserDataSource(storage: ref.read(firebaseStorageProvider)),
    originUser: const OriginUser(
      id: '',
      name: '',
    ),
  ),
);
