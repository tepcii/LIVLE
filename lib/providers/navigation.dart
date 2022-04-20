import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final StateProvider<int> pageIndexProvider = StateProvider<int>(
  (StateProviderRef<int> ref) => 0,
);

final StateProvider<GlobalKey<CurvedNavigationBarState>> bottomNavigationKeyProvider = StateProvider<GlobalKey<CurvedNavigationBarState>>(
  (StateProviderRef<GlobalKey<CurvedNavigationBarState>> ref) => GlobalKey<CurvedNavigationBarState>(),
);
