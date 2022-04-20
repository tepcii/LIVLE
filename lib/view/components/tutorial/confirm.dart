import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livle/providers/view_model/user_register.dart';
import 'package:livle/view/components/tutorial/user_icon.dart';

class ConfirmDialog extends HookConsumerWidget {
  const ConfirmDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserRegisterViewModel userState = ref.watch(userRegisterViewModelNotifierProvider);
    return Container(
      child: Column(
        children: <Widget>[
          const Text('以下の内容で登録してもよろしいですか？'),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: UserIcon(
              imagePath: userState.originUserForRegister.iconImagePath,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Icon(FontAwesomeIcons.userTag),
                Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Text(userState.originUserForRegister.id),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Icon(FontAwesomeIcons.user),
                Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Text(userState.originUserForRegister.name),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Icon(FontAwesomeIcons.idCard),
                Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Text(userState.originUserForRegister.description),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
