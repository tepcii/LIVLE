import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

final StateProvider<int> pageIndexProvider = StateProvider<int>(
  (ProviderReference ref) => 0,
);

final StateProvider<GlobalKey<CurvedNavigationBarState>> bottomNavigationKeyProvider = StateProvider<GlobalKey<CurvedNavigationBarState>>(
  (ProviderReference ref) => GlobalKey<CurvedNavigationBarState>(),
);
