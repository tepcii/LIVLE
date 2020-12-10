import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:livle/providers/firebase_providers.dart';
import 'package:livle/source/interfaces/user.dart';
import 'package:livle/source/user.dart';

part 'user.freezed.dart';

@freezed
abstract class OriginUser with _$OriginUser {
  const factory OriginUser({
    @required IUserDataSource source,
    @required String id,
    @required String name,
    @Default('') String description,
    @Default('images/default_user_icon.png') String iconImagePath,
    @Default(false) bool pickedImage,
    @Default(false) bool isBanned,
    @Default(false) bool isOfficial,
  }) = _OriginUser;
}

final Provider<OriginUser> originUserProvider = Provider<OriginUser>(
  (ProviderReference ref) => OriginUser(
    source: UserDataSource(storage: ref.read(firebaseStorageProvider)),
    id: '',
    name: '',
    description: '',
    iconImagePath: 'images/default_user_icon.png',
    pickedImage: false,
  ),
);
