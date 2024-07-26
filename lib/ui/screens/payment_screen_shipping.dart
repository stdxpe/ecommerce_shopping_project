import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/ui/widgets/%20bottom_sheets/bottom_sheet_buttons_payment_shipping.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class PaymentScreenShipping extends StatelessWidget {
  const PaymentScreenShipping({
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
              if (showTitle!)
                const TitleMain(
                  title: AppStrings.paymentScreenTitleShipping,
                  stepNumber: 1,
                ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const ClampingScrollPhysics(),
                  children: const [
                    // SizedBox(height: 100),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomSheetButtonsPaymentShipping(
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
