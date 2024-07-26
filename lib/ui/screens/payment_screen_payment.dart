import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_checkbox_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/ui/widgets/textformfield_main.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/ui/widgets/%20bottom_sheets/bottom_sheet_buttons_payment_method.dart';
import 'package:ecommerce_shopping_project/ui/widgets/sliders/credit_cards_slider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  physics: const ClampingScrollPhysics(),
                  children: [
                    if (showTitle!)
                      const TitleMain(
                        title: AppStrings.paymentScreenTitlePayment,
                        stepNumber: 2,
                      ),

                    /// CREDIT CARDS SLIDER
                    const CreditCardsSlider(),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Constants.kMainPaddingHorizontal.w * 2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50.h),
                          const TextformfieldMain(
                            text: AppStrings.paymentScreenCreditCardTextField1,
                          ),
                          SizedBox(height: 50.h),
                          const TextformfieldMain(
                            text: AppStrings.paymentScreenCreditCardTextField2,
                            textInputType: TextInputType.number,
                          ),
                          SizedBox(height: 50.h),
                          Row(
                            children: [
                              const Flexible(
                                child: TextformfieldMain(
                                  text: AppStrings
                                      .paymentScreenCreditCardTextField3,
                                  textInputType: TextInputType.number,
                                ),
                              ),
                              SizedBox(width: 30.w),
                              const Flexible(
                                child: TextformfieldMain(
                                  text: AppStrings
                                      .paymentScreenCreditCardTextField4,
                                  textInputType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 100.h),
                          SwitchCheckboxMain(
                            isChecked: true,
                            uncheckedColor: Colors.black12,
                            text: TextCustom(
                              text: AppStrings.paymentScreenCreditCardCheckBox,
                              textStyle: context.textTheme.labelSmall!,
                              color: context.colorPalette.text,
                            ),
                          ),
                        ],
                      ),
                    ),
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
