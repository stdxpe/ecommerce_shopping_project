import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_shopping_project/services/navigation_service.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/services/dummy_data/dummy_all_products.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_buttons_shopping_cart.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_product_card_horizontal_detailed.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMain(
        automaticallyImplyLeading: true,
        useSearchButton: false,
        onPressedBackButtonAlternate: () {
          context.pop();
        },
      ),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: context.mediaQuery.size.height,
          width: context.mediaQuery.size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    const TitleMain(
                      title: AppStrings.shoppingCartScreenTitle,
                      itemCount: 13,
                    ),
                    VerticalListviewProductCardHorizontalDetailed(
                      // useShimmer: true,
                      dismissibleEnabled: true,
                      isCardElevated: false,
                      productsList: dummyAllProducts,
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
                  onPressed: () {
                    context.push(Routes.paymentStepShipping);
                  },
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
