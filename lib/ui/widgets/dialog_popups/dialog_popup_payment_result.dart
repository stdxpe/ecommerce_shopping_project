import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class DialogPopupPaymentResult extends StatelessWidget {
  final double cardHeight;
  final double cardWidth;

  const DialogPopupPaymentResult({
    required this.cardHeight,
    required this.cardWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: Constants.kDialogPopupSpacingBTWTextVertical.h),
          Container(
            height: cardHeight * 0.5,
            width: cardWidth,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withAlpha(35),
            ),
            child: Icon(
              Icons.card_giftcard,
              color: Colors.black,
              size: cardHeight * 0.3,
            ),
          ),
          SizedBox(height: Constants.kDialogPopupSpacingBTWTextVertical.h),
          TextCustom(
            text: AppStrings.paymentScreenTitleSuccessResultMessage,
            textStyle: context.textTheme.displaySmall!,
            color: context.colorPalette.text,
            fontSizeCustom: 100,
            fontWeightCustom: FontWeight.w700,
            fontHeightCustom: 1.0,
            fontLetterSpacingCustom: -0.5,
            textAlignCustom: TextAlign.center,
          ),
          SizedBox(
              height: Constants.kDialogPopupSpacingBTWTextVertical.h * 0.5),
          TextCustom(
            text: AppStrings.paymentScreenSubtitleSuccessResultMessage,
            textStyle: context.textTheme.displaySmall!,
            color: context.colorPalette.text,
            maxLines: 2,
            fontSizeCustom: 40,
            fontWeightCustom: FontWeight.w500,
            fontHeightCustom: 1.0,
            fontLetterSpacingCustom: 0,
            textAlignCustom: TextAlign.center,
          ),
          SizedBox(height: Constants.kDialogPopupSpacingBTWTextVertical.h),
          ButtonMain(
            onPressed: () {},
            text: AppStrings.paymentScreenResultMessageButton,
            paddingHorizontal: Constants.kDialogPopupPaddingButtonHorizontal.w,
            paddingVertical: 0,
          ),
          SizedBox(height: Constants.kDialogPopupPaddingButtonBottom.h),
        ],
      ),
    );
  }
}
