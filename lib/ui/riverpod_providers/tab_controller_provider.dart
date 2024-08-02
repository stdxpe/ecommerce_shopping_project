import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

final tabControllerProvider = StateProvider<PersistentTabController>((ref) {
  PersistentTabController tabController =
      PersistentTabController(initialIndex: 0);
  return tabController;
});
