import 'package:ecommerce_shopping_project/models/order_product.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_all_products.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_shopping_cart_order_products.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/vertical_listview_card_placeholder_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/shopping_cart_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_buttons_shopping_cart.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_order_product_card_horizontal.dart';
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
                      itemCount: ref.watch(shoppingCartProvider).value?.length,
                    ),
                    ref.watch(shoppingCartProvider).when(
                          loading: () =>
                              const VerticalListviewCardPlaceholderHorizontal(
                            itemCount: 3,
                            useTopSpacingForExpandingTitle: true,
                            cardHeight: 250,
                            paddingMain: Constants.kMainPaddingHorizontal,
                            paddingBetweenElements:
                                Constants.kMainSpacingBTWCardsVertical,
                          ),
                          error: (error, stackTrace) => const Text(
                            AppStrings.globalStateErrorMessage,
                            style: TextStyle(color: Colors.black),
                          ),
                          data: (data) =>
                              VerticalListviewOrderProductCardHorizontal(
                            onDismissed: (index) => ref
                                .read(shoppingCartProvider.notifier)
                                .deleteProductFromShoppingCart(
                                    orderProduct: data[index]),
                            dismissibleEnabled: true,
                            orderProductsList: data,
                            // ref.read(shoppingCartProvider.notifier).decreaseItemCounter(index),
                            // ref.read(shoppingCartProvider.notifier).increaseItemCounter(index),
                            onPressedMinus: () {
                              print('onPressedMinus onPressed');
                            },
                            onPressedPlus: () {
                              print('onPressedPlus onPressed');
                            },
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
                  onPressed: () {
                    // return context.push(Routes.paymentStepShipping);
                    ref
                        .read(shoppingCartProvider.notifier)
                        .addProductToShoppingCart(
                          orderProduct: OrderProduct(
                            id: 'OrderProduct05',
                            selectedProduct: dummyAllProducts[1],
                            selectedColor: 'Purple',
                            selectedSize: 'XS',
                            itemCount: 13,
                          ),
                        );
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
