import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/models/dummy_orders_list.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_order_card_horizontal.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarMain(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          children: [
            const TitleMain(
              title: AppStrings.ordersScreenTitle,
              itemCount: 2,
            ),
            VerticalListviewOrderCardHorizontal(
              ordersList: dummyOrdersList,
              cardHeight: 200,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsVertical,
            ),
          ],
        ),
      ),
    );
  }
}
