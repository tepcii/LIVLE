import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:livle/providers/view_model/user.dart';

class HeaderUserIcon extends ConsumerWidget {
  const HeaderUserIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final UserViewModel _userViewModel = watch(userViewModelNotifierProvider);
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
