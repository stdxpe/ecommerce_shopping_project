import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/feature_selector_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_filters.dart';
import 'package:ecommerce_shopping_project/ui/screens/payment_screen_payment.dart';
import 'package:ecommerce_shopping_project/ui/screens/payment_screen_shipping.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_feature_selector.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_profile_edit.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

final bottomSheetProvider =
    StateNotifierProvider<BottomSheetNotifier, void>((ref) {
  return BottomSheetNotifier(ref: ref);
});

class BottomSheetNotifier extends StateNotifier<void> {
  BottomSheetNotifier({required this.ref}) : super(null);
  final StateNotifierProviderRef ref;

  featureSelector({required BuildContext context, required Product product}) {
    /// Resetting the size and color selection, every time bottom sheet appears
    ref.read(colorSelectorProvider.notifier).state = 0;
    ref.read(sizeSelectorProvider.notifier).state = 0;

    _showMainBottomSheet(
      context: context,
      heightRatio: 0.35,
      child: BottomSheetFeatureSelector(product: product),
    );
  }

  filters({required BuildContext context}) {
    _showMainBottomSheet(
      context: context,
      heightRatio: 0.8,
      child: const BottomSheetFilters(),
    );
  }

  creditCards({required BuildContext context}) {
    _showMainBottomSheet(
      context: context,
      heightRatio: 0.75,
      child: const PaymentScreenPayment(isCreateNewCardMode: true),
    );
  }

  addresses({required BuildContext context}) {
    _showMainBottomSheet(
      context: context,
      heightRatio: 0.75,
      child: const PaymentScreenShipping(isCreateNewAddressMode: true),
    );
  }

  profileEdit({required BuildContext context}) {
    _showMainBottomSheet(
      context: context,
      heightRatio: 0.75,
      child: BottomSheetProfileEdit(onPressed: () {}),
    );
  }

  _showMainBottomSheet(
      {required BuildContext context,
      required Widget child,
      double heightRatio = 0.75}) {
    showModalBottomSheet(
      useRootNavigator: true,
      isDismissible: true,
      enableDrag: false,
      constraints: BoxConstraints(
        maxHeight: context.mediaQuery.size.height * heightRatio,
        minHeight: context.mediaQuery.size.height * heightRatio,
        maxWidth: context.mediaQuery.size.width,
        minWidth: context.mediaQuery.size.width,
      ),
      isScrollControlled: true,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            Constants.kRadiusBottomSheets.r,
          ),
        ),
      ),
      backgroundColor: context.colorPalette.sheetBackground,
      barrierColor: Colors.black.withOpacity(0.75),
      context: context,
      builder: (context) => child,
    );
  }
}
