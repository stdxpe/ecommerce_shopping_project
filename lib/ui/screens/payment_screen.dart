import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/payment_steps_navigation_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_navigation_bar/custom_nav_bar_branch_animation.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_payment_status_bar_stepper.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class PaymentScreen extends ConsumerWidget {
  const PaymentScreen(
      {required this.navigationShell, Key? key, required this.children})
      : super(key: key ?? const ValueKey('ScaffoldWithNavBarPaymentScreen'));

  final StatefulNavigationShell navigationShell;

  final List<Widget> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
        .read(paymentStepsNavigation.notifier)
        .setNavigationShell(navigationShell: navigationShell);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.colorPalette.scaffoldBackground,
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: context.mediaQuery.size.height,
          width: context.mediaQuery.size.width,
          child: Column(
            children: [
              SwitchPaymentStatusBarStepper(
                activeStep: navigationShell.currentIndex,
                onPressed: (index) => ref
                    .watch(paymentStepsNavigation.notifier)
                    .goSpecificIndex(targetIndex: index),
                onPressedBackButton: () => ref
                    .watch(paymentStepsNavigation.notifier)
                    .goPreviousPage(context),
              ),
              Expanded(
                child: CustomNavBarBranchAnimation(
                  currentIndex: navigationShell.currentIndex,
                  children: children,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
