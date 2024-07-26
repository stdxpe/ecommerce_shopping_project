import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/%20bottom_sheets/bottom_sheet_buttons_payment_shipping.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_checkbox_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/ui/widgets/textformfield_main.dart';
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
      // backgroundColor: Colors.red,
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
                  padding: EdgeInsets.symmetric(
                    horizontal: Constants.kMainPaddingHorizontal.w * 2,
                  ),
                  physics: const ClampingScrollPhysics(),
                  children: [
                    const TextformfieldMain(
                      text: AppStrings.paymentScreenShippingTextField1,
                    ),
                    SizedBox(height: 50.h),
                    const TextformfieldMain(
                      text: AppStrings.paymentScreenShippingTextField2,

                      /// TODO: Multiline address entry.
                      textInputType: TextInputType.multiline,
                    ),
                    SizedBox(height: 50.h),
                    Row(
                      children: [
                        const Flexible(
                          child: TextformfieldMain(
                            text: AppStrings.paymentScreenShippingTextField3,
                          ),
                        ),
                        SizedBox(width: 30.w),
                        const Flexible(
                          child: TextformfieldMain(
                            text: AppStrings.paymentScreenShippingTextField4,
                            textInputType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    const TextformfieldMain(
                      text: AppStrings.paymentScreenShippingTextField5,
                    ),
                    SizedBox(height: 100.h),
                    SwitchCheckboxMain(
                      isChecked: true,
                      uncheckedColor: Colors.black12,
                      text: TextCustom(
                        text: AppStrings.paymentScreenShippingCheckBox,
                        textStyle: context.textTheme.labelSmall!,
                        color: context.colorPalette.text,
                      ),
                    ),
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
