import 'dart:ui';
import 'package:ecommerce_shopping_project/models/collection.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_collections.dart';
import 'package:ecommerce_shopping_project/ui/widgets/dialog_popups/dialog_popup_new_deals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/widgets/dialog_popups/dialog_popup_payment_result.dart';
import 'package:ecommerce_shopping_project/ui/widgets/dialog_popups/dialog_popup_product_added_to_cart.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

final dialogPopupProvider =
    StateNotifierProvider<DialogPopupNotifier, void>((ref) {
  return DialogPopupNotifier();
});

class DialogPopupNotifier extends StateNotifier<void> {
  DialogPopupNotifier() : super(null);

  addedToCart({required BuildContext context, required Product product}) {
    _showMainDialogPopup(
      context: context,
      child: DialogPopupProductAddedToCart(
        onPressedGoToCart: (context) {
          context.pop();
          context.pushReplacement(Routes.home);
          context.push(Routes.shoppingCart);
        },
        onPressedContinue: (context) => context.pop(),
        imageUrl: product.mainPhoto,
        cardHeight: context.mediaQuery.size.height * 0.45,
        cardWidth: context.mediaQuery.size.width * 0.75,
      ),
    );
  }

  paymentResult({required BuildContext context}) {
    _showMainDialogPopup(
      context: context,
      child: DialogPopupPaymentResult(
        cardHeight: context.mediaQuery.size.height * 0.45,
        cardWidth: context.mediaQuery.size.width * 0.75,
        onPressed: () {
          context.pop();
          context.go(Routes.home);
        },
      ),
    );
  }

  newDeals({required BuildContext context, required Collection collection}) {
    _showMainDialogPopup(
      context: context,
      child: DialogPopupNewDeals(
        imageUrl: collection.photo,
        cardHeight: context.mediaQuery.size.height * 0.5,
        cardWidth: context.mediaQuery.size.width * 0.75,
        onPressed: () {
          context.pop();
          context.push(Routes.collectionDetails, extra: collection);
        },
      ),
    );
  }

  _showMainDialogPopup({required BuildContext context, required Widget child}) {
    showDialog(
      barrierColor: Colors.black.withOpacity(0.75),
      barrierDismissible: true,
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7.5, sigmaY: 7.5),
        child: AlertDialog(
          backgroundColor: context.colorPalette.scaffoldBackground,
          surfaceTintColor: context.colorPalette.scaffoldBackground,
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          clipBehavior: Clip.hardEdge,
          elevation: 2.5,
          shadowColor: Colors.white.withOpacity(0.05),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(Constants.kRadiusDialogPopups.r),
          ),
          title: child,
        ),
      ).animate().fadeIn(duration: 250.ms),
    );
  }
}
