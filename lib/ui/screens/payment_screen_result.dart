import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/order_providers.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/payment_steps_navigation_provider.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/shopping_cart_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_buttons_payment_result.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class PaymentScreenResult extends ConsumerWidget {
  const PaymentScreenResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: context.mediaQuery.size.height,
          width: context.mediaQuery.size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const ClampingScrollPhysics(),
                  children: const [
                    TitleMain(
                      title: AppStrings.paymentScreenTitleResult,
                      stepNumber: 4,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomSheetButtonsPaymentResult(
                  onPressed: () {
                    /// TODO: Stripe Result Here

                    /// Order Created on DB
                    ref.read(ordersProvider.notifier).createOrder();

                    /// Shopping Cart Resetted
                    ref
                        .read(shoppingCartProvider.notifier)
                        .resetShoppingCartAfterCheckout();

                    /// Directing to the Dialog Popup Screen
                    ref
                        .read(paymentStepsNavigation.notifier)
                        .goSpecificIndex(targetIndex: 4);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
