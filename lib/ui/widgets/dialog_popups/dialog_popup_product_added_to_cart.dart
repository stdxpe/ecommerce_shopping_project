import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class DialogPopupProductAddedToCart extends ConsumerWidget {
  const DialogPopupProductAddedToCart({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cardHeight = context.mediaQuery.size.height * 0.5;
    var cardWidth = context.mediaQuery.size.width * 0.75;
    return SizedBox(
      width: cardWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            height: cardHeight * 0.5,
            width: cardWidth,
            product.mainPhoto,
            fit: BoxFit.cover,
            alignment: Alignment.center,
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
            onPressed: () {
              context.pop();
              context.go(Routes.home);
              context.push(Routes.shoppingCart);
            },
            text: AppStrings.productDetailsScreenPopupButtonGoToShoppingCart,
            paddingHorizontal: Constants.kDialogPopupPaddingButtonHorizontal.w,
            paddingVertical: 0,
          ),
          SizedBox(height: Constants.kDialogPopupSpacingBTWButtonsVertical.h),
          ButtonMain(
            onPressed: () => context.pop(),
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
