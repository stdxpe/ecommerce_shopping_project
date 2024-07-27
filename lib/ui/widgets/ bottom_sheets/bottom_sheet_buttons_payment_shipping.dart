import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class BottomSheetButtonsPaymentShipping extends StatelessWidget {
  const BottomSheetButtonsPaymentShipping({
    super.key,
    required this.onPressed,
    this.buttonText,
    this.paddingHorizontal,
  });

  final Function() onPressed;
  final String? buttonText;
  final double? paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorPalette.sheetBackground,
        boxShadow: [
          BoxShadows.kBoxShadowBottomSheet(
            color: context.colorPalette.shadowPrimary.withOpacity(0.2),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        left: paddingHorizontal ?? Constants.kButtonPaddingHorizontal.w,
        right: paddingHorizontal ?? Constants.kButtonPaddingHorizontal.w,
        bottom: Constants.kButtonPaddingBottom.h,
        top: 60.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: ButtonMain(
                  onPressed: () {
                    onPressed();
                  },
                  text:
                      buttonText ?? AppStrings.paymentScreenShippingSheetButton,
                  backgroundColor:
                      context.colorPalette.buttonMainBackgroundPrimary,
                  foregroundColor:
                      context.colorPalette.buttonMainForegroundPrimary,
                  paddingHorizontal: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
