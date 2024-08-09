import 'dart:ui';
import 'package:ecommerce_shopping_project/ui/widgets/dialog_popups/dialog_popup_new_deals.dart';
import 'package:ecommerce_shopping_project/ui/widgets/dialog_popups/dialog_popup_product_added_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/dialog_popups/dialog_popup_payment_result.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class DialogPopupMainAlertDialog extends StatelessWidget {
  const DialogPopupMainAlertDialog({
    super.key,
    // required this.onPressed,
  });

  // final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 7.5, sigmaY: 7.5),
      child: AlertDialog(
        backgroundColor: context.colorPalette.sheetBackground,
        surfaceTintColor: context.colorPalette.scaffoldBackground,
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        elevation: 2.5,
        shadowColor: Colors.white.withOpacity(0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.kRadiusDialogPopups.r),
        ),
        // title: DialogPopupPaymentResult(
        // title: DialogPopupNewDeals(
        title: DialogPopupProductAddedToCart(
          onPressedContinue: (context) {}, onPressedGoToCart: (context) {},
          imageUrl: AppImages.productImage1,
          // onPressed: () {
          //   onPressed();
          // },
          cardHeight: context.mediaQuery.size.height * 0.5,
          cardWidth: context.mediaQuery.size.width * 0.75,
        ),
      ),
    ).animate().fadeIn(duration: 250.ms);
  }
}
