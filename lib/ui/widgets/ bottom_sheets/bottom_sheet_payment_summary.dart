import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_payment_summary_section.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class BottomSheetPaymentSummary extends StatelessWidget {
  const BottomSheetPaymentSummary({
    super.key,
    required this.onPressed,
    this.paddingHorizontal,
  });

  final Function() onPressed;
  final double? paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.grey.withOpacity(0.3),
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
          SizedBox(height: 30.h),
          TitlePaymentSummarySection(
            onPressed: () {},
            title: AppStrings.paymentScreenSummarySheetSectionAddress,
            subtext:

                /// TODO: Address and Credit Card gotta come from User Profile.
                '21st Greenday Street 10021\nNew York Manhattan\nUnited States',
          ),
          SizedBox(height: 60.h),
          TitlePaymentSummarySection(
            onPressed: () {},
            title: AppStrings.paymentScreenSummarySheetSectionPayment,
            subtext: '**** **** **** 4871',
          ),
          SizedBox(height: 60.h),
          SizedBox(height: 30.h),

          Row(
            children: [
              // Expanded(
              //   child: ButtonMain(
              //     onPressed: () {
              //       onPressed();
              //     },
              //     text: '${AppStrings.paymentScreenButtonPay}\$147.99',
              //     backgroundColor:
              //         // context.colorPalette.buttonMainBackgroundPrimary,
              //         // context.colorPalette.buttonMainBackgroundSecondary,
              //         context.colorPalette.sheetBackground,
              //     foregroundColor:
              //         // context.colorPalette.buttonMainForegroundPrimary,
              //         context.colorPalette.buttonMainForegroundSecondary,
              //     paddingHorizontal: 0,
              //     borderWidth: 2.5,
              //     useShadow: false,
              //   ),
              // ),
              // SizedBox(width: Constants.kButtonSpacingBTWButtonsHorizontal.w),
              Expanded(
                child: ButtonMain(
                  // fontSize: 40,
                  onPressed: () {
                    onPressed();
                  },
                  text: '${AppStrings.paymentScreenSummarySheetButton}\$147.99',
                  backgroundColor:
                      context.colorPalette.buttonMainBackgroundPrimary,
                  foregroundColor:
                      context.colorPalette.buttonMainForegroundPrimary,
                  paddingHorizontal: 0,
                ),
              ),
            ],
          ),
          // SizedBox(height: 30.h),

          // ButtonMain(
          //   onPressed: () {
          //     onPressed();
          //   },
          //   text: '${AppStrings.paymentScreenButtonPay}\$147.99',
          //   backgroundColor:
          //       // context.colorPalette.buttonMainBackgroundPrimary,
          //       // context.colorPalette.buttonMainBackgroundSecondary,
          //       context.colorPalette.sheetBackground,
          //   foregroundColor:
          //       // context.colorPalette.buttonMainForegroundPrimary,
          //       context.colorPalette.buttonMainForegroundSecondary,
          //   paddingHorizontal: 0,
          //   borderWidth: 2.5,
          //   useShadow: false,
          // ),
        ],
      ),
    );
  }
}
