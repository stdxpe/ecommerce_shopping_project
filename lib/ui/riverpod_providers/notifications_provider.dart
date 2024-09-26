import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/services/abstract_classes/i_local_db_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

final notifications = StateNotifierProvider<NotificationsNotifier, bool>(
    (ref) => NotificationsNotifier());

class NotificationsNotifier extends StateNotifier<bool> {
  NotificationsNotifier() : super(true) {
    getInitialNotificationSelectionFromLocalDB();
  }

  final _localDB = locator<ILocalDBService>();

  getInitialNotificationSelectionFromLocalDB() {
    String? notifications = _localDB.getData(key: LocalDB.notificationMode);

    if (notifications == LocalDB.notificationsON) {
      state = true;
    } else if (notifications == LocalDB.notificationsOFF) {
      state = false;
    } else {
      state = true;
    }
  }

  toggleSwitch() {
    if (state == true) {
      _localDB.updateData(
          key: LocalDB.notificationMode, value: LocalDB.notificationsOFF);
      state = false;
    } else if (state == false) {
      _localDB.updateData(
          key: LocalDB.notificationMode, value: LocalDB.notificationsON);
      state = true;
    } else {
      state = true;
    }
  }
}
