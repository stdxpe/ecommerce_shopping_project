import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/order.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/listview_order_card_horizontal_detailed.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_tracking_order_stepper.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class TrackingOrderScreen extends StatelessWidget {
  const TrackingOrderScreen({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          children: [
            TitleMain(
              title: AppStrings.trackingOrderScreenTitle,
              enableTitleAsBackButton: true,
              paddingTop: Constants.kMainTitleTopPaddingWithoutAppBar.h,
            ),
            ListviewOrderCardHorizontalDetailed(order: order),
            SizedBox(height: 125.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 75.w),
              child: SwitchTrackingOrderStepper(order: order),
            ),
          ],
        ),
      ),
    );
  }
}
