import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class OriginUser with _$OriginUser {
  const factory OriginUser({
    @Default('') String id,
    @Default('') String name,
    @Default('') String description,
    @Default('images/default_user_icon.png') String iconImagePath,
    @Default(false) bool pickedImage,
  }) = _OriginUser;
}
