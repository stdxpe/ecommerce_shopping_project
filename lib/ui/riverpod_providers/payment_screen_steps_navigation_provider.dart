import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/dialog_popup_providers.dart';

final paymentScreenNavigationProvider =
    StateNotifierProvider<PaymentScreenNavigationProviderNotifier, int>((ref) {
  return PaymentScreenNavigationProviderNotifier();
});

class PaymentScreenNavigationProviderNotifier extends StateNotifier<int> {
  PaymentScreenNavigationProviderNotifier() : super(0);

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

    if (targetIndex == 0 && currentIndex != 0) {
      _navigationShell.goBranch(0);
    } else if (targetIndex == 1 && currentIndex != 1) {
      /// Conditions/Validations of Shipping Step Set ?

      _navigationShell.goBranch(1);
    } else if (targetIndex == 2 && currentIndex != 2) {
      /// Conditions/Validations of Shipping Step Set ?
      /// Conditions/Validations of Payment Step Set ?

      _navigationShell.goBranch(2);
    } else if (currentIndex == 2 && currentIndex != 3) {
      /// Conditions/Validations of Shipping Step (using other ref's)
      /// another if(conditions are met) ? goBranch : null
      _navigationShell.goBranch(3);
    } else if (currentIndex == 3) {
      /// Conditions/Validations of Shipping Step (using other ref's)
      /// another if(conditions are met) ? go(home) : null
      // context.go(Routes.home);
    }
  }

  goNextStep(BuildContext context, WidgetRef ref) {
    int currentIndex = _navigationShell.currentIndex;

    if (currentIndex == 0) {
      // goSpecificIndex(targetIndex: 0) BETTER SOLUTION / LESS VERBOSE

      /// Conditions/Validations of Shipping Step (using other ref's)
      /// another if(conditions are met) ? goBranch : null
      // navigationShell.goBranch(currentIndex + 1);
      _navigationShell.goBranch(1);
      // context.go(Routes.paymentStepPayment);
    } else if (currentIndex == 1) {
      /// Conditions/Validations of Shipping Step (using other ref's)
      /// another if(conditions are met) ? goBranch : null
      _navigationShell.goBranch(2);
      // context.go(Routes.paymentStepSummary);
    } else if (currentIndex == 2) {
      /// Conditions/Validations of Shipping Step (using other ref's)
      /// another if(conditions are met) ? goBranch : null
      _navigationShell.goBranch(3);
      // context.go(Routes.paymentStepResult);
    } else if (currentIndex == 3) {
      /// Conditions/Validations of Shipping Step (using other ref's)
      /// another if(conditions are met) ? go(home) : null
      // context.go(Routes.home);
      ref.read(dialogPopupProvider.notifier).paymentResult(context: context);
    }
  }
}
