import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livle/repositories/artist_list.dart';
import 'package:livle/repositories/schedule_list.dart';

final ChangeNotifierProvider<ScheduleViewModel> scheduleViewModelNotifierProvider = ChangeNotifierProvider<ScheduleViewModel>(
  (ChangeNotifierProviderRef<ScheduleViewModel> ref) => ScheduleViewModel(
    scheduleRepository: ref.watch(scheduleRepositoryProvider),
    artistRepository: ref.watch(artistsRepositoryProvider),
  ),
);

class ScheduleViewModel extends ChangeNotifier {
  ScheduleViewModel({
    required ScheduleRepository scheduleRepository,
    required ArtistRepository artistRepository,
  })  : _scheduleRepository = scheduleRepository,
        _artistRepository = artistRepository;

  final ScheduleRepository _scheduleRepository;
  final ArtistRepository _artistRepository;

  ScheduleRepository get scheduleRepository => _scheduleRepository;
  ArtistRepository get artistRepository => _artistRepository;
}
