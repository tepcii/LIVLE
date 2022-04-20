import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:livle/repositories/artist.dart';
import 'package:livle/repositories/artist_list.dart';
import 'package:livle/repositories/money.dart';
import 'package:livle/repositories/money_list.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:uuid/uuid.dart';

final ChangeNotifierProvider<MoneyRegisterViewModel> moneyRegisterViewModelNotifierProvider = ChangeNotifierProvider<MoneyRegisterViewModel>(
  (ChangeNotifierProviderRef<MoneyRegisterViewModel> ref) => MoneyRegisterViewModel(
    artistRepository: ref.watch(artistsRepositoryProvider),
    moneyRepository: ref.watch(moneyRepositoryProvider),
  ),
);

class MoneyRegisterViewModel extends ChangeNotifier {
  MoneyRegisterViewModel({
    required ArtistRepository artistRepository,
    required MoneyRepository moneyRepository,
  })  : _artistRepository = artistRepository,
        _moneyRepository = moneyRepository;

  final ArtistRepository _artistRepository;
  final MoneyRepository _moneyRepository;

  ArtistRepository get artistRepository => _artistRepository;
  MoneyRepository get moneyRepository => _moneyRepository;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController dateController = TextEditingController();
  final RoundedLoadingButtonController registerBtnController = RoundedLoadingButtonController();
  final Uuid _uuid = const Uuid();

  String _title = '';
  String _amount = '';
  late Timestamp _date;
  String _memo = '';
  late String _artistId;

  List<Artist> get artistList {
    return _artistRepository.artistList.artists;
  }

  List<DropdownMenuItem<String>> get artistDropDownList {
    final List<DropdownMenuItem<String>> list = _artistRepository.artistList.artists
        .map<DropdownMenuItem<String>>((Artist artist) => DropdownMenuItem<String>(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: Icon(
                      Icons.circle,
                      color: Color(artist.color),
                    ),
                  ),
                  Text(artist.name),
                ],
              ),
              value: artist.id,
            ))
        .toList();
    return list;
  }

  Future<void> onPressedRegisterButton(BuildContext context) async {
    if (formKey.currentState?.validate() ?? false) {
      await _moneyRepository.source
          .add(
        Money(
          id: _uuid.v4(),
          amount: int.parse(_amount),
          title: _title,
          date: _date,
          memo: _memo,
          artistId: _artistId,
        ),
      )
          .then((bool value) {
        if (value) {
          registerBtnController.success();
          Navigator.pop(context);
        } else {
          registerBtnController.reset();
        }
      });
    } else {
      registerBtnController.reset();
    }
  }

  String get title => _title;
  set title(String value) {
    _title = value;
    notifyListeners();
  }

  String get amount => _amount;
  set amount(String value) {
    _amount = value;
    notifyListeners();
  }

  Timestamp get date => _date;
  set date(Timestamp value) {
    _date = value;
    dateController.value = TextEditingValue(text: DateFormat('yyyy/MM/dd').format(value.toDate()));
    notifyListeners();
  }

  String get memo => _memo;
  set memo(String value) {
    _memo = value;
    notifyListeners();
  }

  String get artistId => _artistId;
  set artistId(String value) {
    _artistId = value;
    notifyListeners();
  }
}
