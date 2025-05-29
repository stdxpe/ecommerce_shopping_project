import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class DialogPopupError extends StatelessWidget {
  const DialogPopupError({super.key});

  @override
  Widget build(BuildContext context) {
    var cardHeight = context.mediaQuery.size.height * 0.4;
    var cardWidth = context.mediaQuery.size.width * 0.5;
    return SizedBox(
      width: cardWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: Constants.kDialogPopupSpacingBTWTextVertical.h),
          SizedBox(
            height: cardHeight * 0.4,
            width: cardWidth,
            child: Center(
              child: Icon(
                Icons.error_outline,
                color: Colors.black.withOpacity(0.5),
                size: cardHeight * 0.35,
              ),
            ),
          ),
          SizedBox(height: Constants.kDialogPopupSpacingBTWTextVertical.h),
          TextCustom(
            text: AppStrings.dialogPopupErrorTitle,
            textStyle: context.textTheme.displaySmall!,
            color: context.colorPalette.text,
            fontSizeCustom: 60,
            fontWeightCustom: FontWeight.w700,
            fontHeightCustom: 1.0,
            fontLetterSpacingCustom: -0.5,
            textAlignCustom: TextAlign.center,
          ),
          SizedBox(
              height: Constants.kDialogPopupSpacingBTWTextVertical.h * 0.5),
          TextCustom(
            text: AppStrings.dialogPopupErrorSubtitle,
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
            onPressed: () => context.pop(),
            text: AppStrings.dialogPopupErrorButton,
            paddingHorizontal: Constants.kDialogPopupPaddingButtonHorizontal.w,
            paddingVertical: 0,
          ),
          SizedBox(height: Constants.kDialogPopupPaddingButtonBottom.h),
        ],
      ),
    );
  }
}
