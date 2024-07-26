import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/ui/widgets/%20bottom_sheets/bottom_sheet_buttons_payment_method.dart';
import 'package:ecommerce_shopping_project/ui/widgets/sliders/credit_cards_slider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class PaymentScreenPayment extends StatelessWidget {
  const PaymentScreenPayment({
    super.key,
    required this.onPressed,
    this.showTitle = true,
  });

  final Function() onPressed;
  final bool? showTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const AppBarMain(),
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
                  physics: ClampingScrollPhysics(),
                  children: [
                    if (showTitle!)
                      const TitleMain(
                        title: AppStrings.paymentScreenTitlePayment,
                        stepNumber: 2,
                      ),

                    // SizedBox(height: 100),

                    /// CREDIT CARDS SLIDER
                    CreditCardsSlider(),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomSheetButtonsPaymentMethod(
                  onPressed: () {
                    onPressed();
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
