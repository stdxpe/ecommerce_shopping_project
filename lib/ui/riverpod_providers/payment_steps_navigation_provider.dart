import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/credit_card_providers.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/shipping_addresses_providers.dart';

final paymentStepsNavigation =
    StateNotifierProvider<PaymentStepsNavigationNotifier, int>(
        (ref) => PaymentStepsNavigationNotifier(ref: ref));

class PaymentStepsNavigationNotifier extends StateNotifier<int> {
  PaymentStepsNavigationNotifier({required this.ref}) : super(0);

  final StateNotifierProviderRef ref;

  late StatefulNavigationShell _navigationShell;

  setNavigationShell({required StatefulNavigationShell navigationShell}) {
    _navigationShell = navigationShell;
  }

  goPreviousPage(BuildContext context) {
    int currentIndex = _navigationShell.currentIndex;

    (currentIndex > 0)
        ? _navigationShell.goBranch(currentIndex - 1)
        : context.pop();
  }

  goSpecificIndex({required int targetIndex}) {
    int currentIndex = _navigationShell.currentIndex;

    ref.invalidate(addressProviderForSummary);
    ref.invalidate(creditCardProviderForSummary);

    var address = ref.read(addressProviderForSummary);
    var creditCard = ref.read(creditCardProviderForSummary);

    if (targetIndex == 0 && currentIndex != 0) {
      _navigationShell.goBranch(0);
    } else if (targetIndex == 1 && currentIndex != 1) {
      if (address != null) _navigationShell.goBranch(1);
    } else if (targetIndex == 2 && currentIndex != 2) {
      if (address != null && creditCard != null) _navigationShell.goBranch(2);
    }
  }
}
