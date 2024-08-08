import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/payment_screen_steps_navigation_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_navigation_bar/custom_nav_bar_branch_animation.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_payment_status_bar_stepper.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class PaymentScreen extends ConsumerWidget {
  const PaymentScreen(
      {required this.navigationShell, Key? key, required this.children})
      : super(
            key: key ??
                const ValueKey<String>('ScaffoldWithNavBarPaymentScreen'));

  final StatefulNavigationShell navigationShell;

  final List<Widget> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
        .read(paymentScreenNavigationProvider.notifier)
        .setNavigationShell(navigationShell: navigationShell);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.colorPalette.scaffoldBackground,
      appBar: AppBarMain(
        useSearchButton: false,
        automaticallyImplyLeading: true,
        onPressedBackButtonAlternate: () {
          ref
              .watch(paymentScreenNavigationProvider.notifier)
              .goPreviousPage(context);
        },
      ),
      // appBar: AppBar(
      //   toolbarHeight: 175.h,
      //   title: SwitchPaymentStatusBarStepper(
      //     activeStep: navigationShell.currentIndex,
      //     onPressed: (index) {
      //       ref
      //           .watch(paymentScreenNavigationProvider.notifier)
      //           .goSpecificIndex(targetIndex: index);
      //     },
      //   ),
      // ),
      body: SizedBox(
        height: context.mediaQuery.size.height,
        width: context.mediaQuery.size.width,
        child: Column(
          children: [
            SwitchPaymentStatusBarStepper(
              activeStep: navigationShell.currentIndex,
              onPressed: (index) {
                ref
                    .watch(paymentScreenNavigationProvider.notifier)
                    .goSpecificIndex(targetIndex: index);
              },
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
    );
  }
}
