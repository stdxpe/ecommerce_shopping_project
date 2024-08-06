import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/models/order_product.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_all_products.dart';
import 'package:ecommerce_shopping_project/services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_buttons_shopping_cart.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_order_product_card_horizontal.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const TitleMain(
                      title: AppStrings.shoppingCartScreenTitle,
                      // ref.watch(shoppingCartProvider).length;
                      itemCount: 13,
                    ),
                    // ref.watch(shoppingCartProvider).when
                    VerticalListviewOrderProductCardHorizontal(
                      // useShimmer: true,
                      dismissibleEnabled: true,
                      isCardElevated: false,
                      orderProductsList: [
                        OrderProduct(
                          id: '001',

                          /// TODO: Need selectedProduct with productId
                          selectedProduct: dummyAllProducts[1],
                          selectedColor: 'Yellow',
                          selectedSize: 'XL',
                          itemCount: 1,
                        )
                      ],
                      cardHeight: 250,
                      paddingMain: Constants.kMainPaddingHorizontal,
                      paddingBetweenElements:
                          Constants.kMainSpacingBTWCardsVertical,
                    ),
                    SizedBox(height: 100.h),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomSheetButtonsShoppingCart(
                  onPressed: () => context.push(Routes.paymentStepShipping),

                  // ref.watch(shoppingCartProvider.notifier).totalAmount();
                  totalAmount: 210.99,
                  shippingFee: 5.99,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
