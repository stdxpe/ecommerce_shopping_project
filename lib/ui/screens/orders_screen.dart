import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/order_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/listview_order_card_horizontal.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class OrdersScreen extends ConsumerWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          children: [
            TitleMain(
              title: AppStrings.ordersScreenTitle,
              itemCount: ref.watch(ordersProvider).value?.length ?? 0,
              enableTitleAsBackButton: true,
              paddingTop: Constants.kMainTitlePaddingTopWithoutAppBar.h,
              paddingHorizontal: Constants.kMainPaddingHorizontal.w,
            ),
            ListviewOrderCardHorizontal(provider: ordersProvider),
          ],
        ),
      ),
    );
  }
}
