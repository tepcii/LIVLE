import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState({
    @Default("") String uid,
  }) = _UserState;
}

class UserController extends StateNotifier<UserState> {
  UserController() : super(UserState());

  // ユーザーIDを保持
  void login(String uid) {
    state = state.copyWith(
      uid: uid,
    );
  }
}
