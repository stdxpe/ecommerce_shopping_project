import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationsProvider =
    StateNotifierProvider<NotificationsNotifier, bool>((ref) {
  return NotificationsNotifier();
});

class NotificationsNotifier extends StateNotifier<bool> {
  NotificationsNotifier() : super(true);

  toggleSwitch() {
    if (state == true) {
      ///TODO: Notifications OFF operation
      state = false;
    } else if (state == false) {
      ///TODO: Notifications ON operation
      state = true;
    }
  }
}
