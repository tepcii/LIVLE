import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livle/repositories/artist_list.dart';
import 'package:livle/repositories/money_list.dart';
import 'package:livle/repositories/schedule_list.dart';

final ChangeNotifierProvider<ArtistViewModel> artistViewModelNotifierProvider = ChangeNotifierProvider<ArtistViewModel>(
  (ChangeNotifierProviderRef<ArtistViewModel> ref) => ArtistViewModel(
    scheduleRepository: ref.watch(scheduleRepositoryProvider),
    artistRepository: ref.watch(artistsRepositoryProvider),
    moneyRepository: ref.watch(moneyRepositoryProvider),
  ),
);

class ArtistViewModel extends ChangeNotifier {
  ArtistViewModel({
    required ArtistRepository artistRepository,
    required ScheduleRepository scheduleRepository,
    required MoneyRepository moneyRepository,
  })  : _scheduleRepository = scheduleRepository,
        _artistRepository = artistRepository,
        _moneyRepository = moneyRepository;

  final ArtistRepository _artistRepository;
  final ScheduleRepository _scheduleRepository;
  final MoneyRepository _moneyRepository;

  ScheduleRepository get scheduleRepository => _scheduleRepository;
  ArtistRepository get artistRepository => _artistRepository;
  MoneyRepository get moneyRepository => _moneyRepository;
}
