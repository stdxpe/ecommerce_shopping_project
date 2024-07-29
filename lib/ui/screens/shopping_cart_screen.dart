import 'package:ecommerce_shopping_project/ui/screens/payment_screen_pageview.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/models/dummy_product_short_list.dart';
import 'package:ecommerce_shopping_project/ui/widgets/%20bottom_sheets/bottom_sheet_buttons_shopping_cart.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_product_card_horizontal_detailed.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onPressed: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      pageTransitionAnimation: PageTransitionAnimation.fade,
                      context,
                      screen: const PaymentScreenPageview(),
                      withNavBar: false,
                    );
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
