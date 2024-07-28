import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_circular_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/icon_button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_item_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/models/dummy_product_short_list.dart';
import 'package:ecommerce_shopping_project/ui/widgets/%20bottom_sheets/bottom_sheet_buttons_shopping_cart.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_product_card_horizontal_detailed.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarMain(),
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
                      isCardElevated: false,
                      // productsList: dummyProductList,
                      productsList: dummyProductShortList,
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
                  onPressed: () {},
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
