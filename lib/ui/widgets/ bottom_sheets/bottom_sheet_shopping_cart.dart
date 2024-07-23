import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class BottomSheetShoppingCart extends StatelessWidget {
  const BottomSheetShoppingCart({
    super.key,
    required this.totalAmount,
    required this.shippingFee,
    this.paddingHorizontal,
  });
  final double totalAmount;
  final double shippingFee;
  final double? paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey.withOpacity(0.3),
      decoration: BoxDecoration(
        color: context.colorPalette.sheetBackground,
        boxShadow: [
          BoxShadows.kBoxShadowBottomSheet(
            color: context.colorPalette.shadowPrimary,
          ),
        ],
      ),
      padding: EdgeInsets.only(
        left: paddingHorizontal ?? Constants.kButtonPaddingHorizontal.w,
        right: paddingHorizontal ?? Constants.kButtonPaddingHorizontal.w,
        top: 90.h,
        bottom: Constants.kButtonPaddingBottom.h,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TextCustom(
                  text: 'Total Amount',
                  textStyle: context.textTheme.bodyMedium!,
                  color: context.colorPalette.cardTextSecondary,
                  fontSizeCustom: 40,
                  fontWeightCustom: FontWeight.w400,
                ),
              ),
              const Flexible(flex: 1, child: SizedBox(width: 0)),
              Flexible(
                child: TextCustom(
                  text: '\$${totalAmount.toStringAsFixed(2)}',
                  textStyle: context.textTheme.bodyLarge!,
                  color: context.colorPalette.cardTextPrimary,
                  fontWeightCustom: FontWeight.w700,
                  fontSizeCustom: 42,
                  textAlignCustom: TextAlign.end,
                ),
              ),
            ],
          ),
          SizedBox(height: 90.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TextCustom(
                  text: 'Shipping Fee',
                  textStyle: context.textTheme.bodyMedium!,
                  color: context.colorPalette.cardTextSecondary,
                  fontSizeCustom: 40,
                  fontWeightCustom: FontWeight.w400,
                ),
              ),
              const Flexible(flex: 1, child: SizedBox(width: 0)),
              Flexible(
                child: TextCustom(
                  text: '\$${shippingFee.toStringAsFixed(2)}',
                  textStyle: context.textTheme.bodyLarge!,
                  color: context.colorPalette.cardTextPrimary,
                  fontWeightCustom: FontWeight.w700,
                  fontSizeCustom: 42,
                  textAlignCustom: TextAlign.end,
                ),
              ),
            ],
          ),
          SizedBox(height: 130.h),
          ButtonMain(
            onPressed: () {},
            text: AppStrings.continueButton,
            backgroundColor: context.colorPalette.buttonMainBackgroundPrimary,
            foregroundColor: context.colorPalette.buttonMainForegroundPrimary,
            paddingHorizontal: 0,
          ),
        ],
      ),
    );
  }
}
