import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class BottomSheetButtonsShoppingCart extends StatelessWidget {
  const BottomSheetButtonsShoppingCart({
    super.key,
    required this.onPressed,
    required this.totalAmount,
    required this.shippingFee,
    this.paddingHorizontal,
  });

  final Function() onPressed;
  final double totalAmount;
  final double shippingFee;
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
        children: [
          SizedBox(height: 30.h),
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
            onPressed: () {
              onPressed();
            },
            text: AppStrings.shoppingCartScreenButton,
            backgroundColor: context.colorPalette.buttonMainBackgroundPrimary,
            foregroundColor: context.colorPalette.buttonMainForegroundPrimary,
            paddingHorizontal: 0,
          ),
        ],
      ),
    );
  }
}
