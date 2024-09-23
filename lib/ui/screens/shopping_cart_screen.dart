import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/credit_card_providers.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/shopping_cart_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_buttons_shopping_cart.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/listview_product_card_horizontal_detailed.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ShoppingCartScreen extends ConsumerWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: context.mediaQuery.size.height,
          width: context.mediaQuery.size.width,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    TitleMain(
                      title: AppStrings.shoppingCartScreenTitle,
                      enableTitleAsBackButton: true,
                      paddingTop: Constants.kMainTitlePaddingTopWithoutAppBar.h,
                      paddingHorizontal: Constants.kMainPaddingHorizontal.w,
                      itemCount:
                          ref.watch(shoppingCartProvider).value?.length ?? 0,
                    ),
                    ListviewProductCardHorizontalDetailed(
                      provider: shoppingCartProvider,
                      cardHeight: 250,
                      dismissibleEnabled: true,
                      useItemCounter: true,
                    ),
                    SizedBox(height: Constants.kMainSpacingEndOfScreen.h),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomSheetButtonsShoppingCart(
                  onPressed: () {
                    ref
                        .read(shoppingCartProvider.notifier)
                        .continueToPayment(context: context);

                    /// Resetting the Credit Cards
                    ref.read(selectedCreditCardIndex.notifier).state =
                        ref.read(creditCardsRawList).length - 1;
                  },
                  totalAmount:
                      ref.watch(shoppingCartProvider.notifier).getTotalAmount(),
                  shippingFee:
                      ref.watch(shoppingCartProvider.notifier).getShippingFee(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
