import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/services/abstract_classes/i_local_db_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

final themeMode =
    StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light) {
    getInitialThemeModeFromLocalDB();
  }

  final _localDB = locator<ILocalDBService>();

  getInitialThemeModeFromLocalDB() {
    String? themeMode = _localDB.getData(key: LocalDB.themeMode);

    if (themeMode == LocalDB.themeModeLight) {
      state = ThemeMode.light;
    } else if (themeMode == LocalDB.themeModeDark) {
      state = ThemeMode.dark;
    } else {
      state = ThemeMode.dark;
    }
  }

  toggleTheme() {
    if (state == ThemeMode.light) {
      _localDB.updateData(key: LocalDB.themeMode, value: LocalDB.themeModeDark);
      state = ThemeMode.dark;
    } else if (state == ThemeMode.dark) {
      _localDB.updateData(
          key: LocalDB.themeMode, value: LocalDB.themeModeLight);
      state = ThemeMode.light;
    } else {
      state = ThemeMode.light;
    }
  }
}

final isDarkModeOn = StateProvider<bool>(
    (ref) => ref.watch(themeMode) == ThemeMode.dark ? true : false);
