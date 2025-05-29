import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/listview_product_card_horizontal_detailed.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/shopping_cart_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_buttons_payment_summary.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class PaymentScreenSummary extends StatelessWidget {
  const PaymentScreenSummary({super.key});

  @override
  Widget build(BuildContext context) {
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
                  children: [
                    const TitleMain(
                      title: AppStrings.paymentScreenTitleSummary,
                      stepNumber: 3,
                    ),
                    ListviewProductCardHorizontalDetailed(
                      provider: shoppingCartProvider,
                      enableNavigation: false,
                      cardHeight: 290,
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: BottomSheetButtonsPaymentSummary(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
