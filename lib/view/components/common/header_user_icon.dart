import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livle/providers/view_model/user.dart';

class HeaderUserIcon extends HookConsumerWidget {
  const HeaderUserIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserViewModel _userViewModel = ref.watch(userViewModelNotifierProvider);
    // _userViewModel.downloadUserIcon();
    return FutureBuilder<void>(
      future: _userViewModel.downloadUserIcon(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        return Container(
          width: 40.0,
          height: 40.0,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: _userViewModel.iconImage,
            ),
          ),
        );
      },
    );
  }
}
