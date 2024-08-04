import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class DialogPopupProductAddedToCart extends StatelessWidget {
  const DialogPopupProductAddedToCart({
    required this.onPressed,
    required this.imageUrl,
    required this.cardHeight,
    required this.cardWidth,
    super.key,
  });

  final Function() onPressed;
  final String imageUrl;
  final double cardHeight;
  final double cardWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            height: cardHeight * 0.5,
            width: cardWidth,
            imageUrl,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          SizedBox(height: Constants.kDialogPopupSpacingBTWTextVertical.h),
          TextCustom(
            text: AppStrings
                .productDetailsScreenDialogPopupAddedToShoppingCartMessage,
            textStyle: context.textTheme.displaySmall!,
            color: context.colorPalette.text,
            maxLines: 2,
            fontSizeCustom: 46,
            fontWeightCustom: FontWeight.w600,
            fontHeightCustom: 1.0,
            fontLetterSpacingCustom: 0,
            textAlignCustom: TextAlign.center,
          ),
          SizedBox(height: Constants.kDialogPopupSpacingBTWTextVertical.h),
          ButtonMain(
            onPressed: () {},
            text: AppStrings.productDetailsScreenPopupButtonGoToShoppingCart,
            paddingHorizontal: Constants.kDialogPopupPaddingButtonHorizontal.w,
            paddingVertical: 0,
          ),
          SizedBox(height: Constants.kDialogPopupSpacingBTWButtonsVertical.h),
          ButtonMain(
            onPressed: () {
              onPressed();
            },
            text: AppStrings.productDetailsScreenPopupButtonContinueShopping,
            backgroundColor: context.colorPalette.buttonMainBackgroundSecondary,
            foregroundColor: context.colorPalette.buttonMainForegroundSecondary,
            paddingHorizontal: Constants.kDialogPopupPaddingButtonHorizontal.w,
            paddingVertical: 0,
          ),
          SizedBox(height: Constants.kDialogPopupPaddingButtonBottom.h),
        ],
      ),
    );
  }
}
