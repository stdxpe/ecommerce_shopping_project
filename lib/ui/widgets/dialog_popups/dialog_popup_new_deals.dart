import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class DialogPopupNewDeals extends StatelessWidget {
  const DialogPopupNewDeals({
    required this.imageUrl,
    required this.cardHeight,
    required this.cardWidth,
    super.key,
    this.textColor,
    required this.onPressed,
  });

  final Function() onPressed;
  final String imageUrl;
  final Color? textColor;
  final double cardHeight;
  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(
          imageUrl,
        ),
      )),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextCustom(
                  text: AppStrings.dialogPopupNewDealsTitle,
                  textStyle: context.textTheme.displaySmall!,
                  color: textColor ?? context.colorPalette.permaWhiteColor,
                  maxLines: 2,
                  fontSizeCustom: 120,
                  fontWeightCustom: FontWeight.w700,
                  fontHeightCustom: 1.0,
                  fontLetterSpacingCustom: 0,
                  textAlignCustom: TextAlign.center,
                ),
                SizedBox(
                    height: Constants.kDialogPopupSpacingBTWTextVertical.h),
                TextCustom(
                  text: AppStrings.dialogPopupNewDealsSubtitle,
                  textStyle: context.textTheme.displaySmall!,
                  color: textColor ?? context.colorPalette.permaWhiteColor,
                  fontSizeCustom: 36,
                  fontWeightCustom: FontWeight.w600,
                  fontHeightCustom: 1.0,
                  fontLetterSpacingCustom: 0,
                  textAlignCustom: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned.fill(
            bottom: Constants.kDialogPopupPaddingButtonBottom.h,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ButtonMain(
                onPressed: () => onPressed(),
                text: AppStrings.dialogPopupNewDealsButtonText,
                backgroundColor:
                    context.colorPalette.buttonMainBackgroundSecondary,
                foregroundColor:
                    context.colorPalette.buttonMainForegroundSecondary,
                paddingHorizontal:
                    Constants.kDialogPopupPaddingButtonHorizontal.w,
                paddingVertical: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
