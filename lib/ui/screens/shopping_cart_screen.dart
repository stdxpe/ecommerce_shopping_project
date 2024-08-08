import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/shopping_cart_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_buttons_shopping_cart.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_order_product_card_horizontal.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_placeholder_listview.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ShoppingCartScreen extends ConsumerWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppBarMain(
          automaticallyImplyLeading: true, useSearchButton: false),
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
                      itemCount: ref
                          .watch(shoppingCartProvider.notifier)
                          .getShoppingCartCount(),
                    ),
                    ref.watch(shoppingCartProvider).when(
                          loading: () =>
                              const CardPlaceholderListView(cardHeight: 250),
                          error: (error, stackTrace) => const Text(
                            AppStrings.globalStateErrorMessage,
                            style: TextStyle(color: Colors.black),
                          ),
                          data: (data) =>
                              VerticalListviewOrderProductCardHorizontal(
                            cartProductsList: data,
                            useItemCounter: true,
                            dismissibleEnabled: true,
                            onDismissed: (index) => ref
                                .read(shoppingCartProvider.notifier)
                                .deleteProductFromShoppingCart(
                                    cartProduct: data[index]),
                            onPressedDecrease: (index) => ref
                                .read(shoppingCartProvider.notifier)
                                .decreaseItemCounter(cartProduct: data[index]),
                            onPressedIncrease: (index) => ref
                                .read(shoppingCartProvider.notifier)
                                .increaseItemCounter(cartProduct: data[index]),
                            cardHeight: 250,
                            paddingMain: Constants.kMainPaddingHorizontal,
                            paddingBetweenElements:
                                Constants.kMainSpacingBTWCardsVertical,
                          ),
                        ),
                    SizedBox(height: 100.h),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomSheetButtonsShoppingCart(
                  onPressed: () => ref
                      .read(shoppingCartProvider.notifier)
                      .continueToPaymentButton(context: context),
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
