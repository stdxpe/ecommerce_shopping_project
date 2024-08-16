import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/services/dummy_data/dummy_orders.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_product_card_horizontal_mini.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_tracking_order_stepper.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class TrackingOrderScreen extends StatelessWidget {
  const TrackingOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarMain(
        automaticallyImplyLeading: true,
        useSearchButton: false,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          children: [
            const TitleMain(
              title: AppStrings.trackingOrderScreenTitle,
            ),
            VerticalListviewProductCardHorizontalMini(
              isCardElevated: true,
              // productsList: dummyOrders[0].products,
              productsList: [],
              cardHeight: 200,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            ),
            SizedBox(height: 125.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 75.w),
              child: const SwitchTrackingOrderStepper(
                activeStep: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
