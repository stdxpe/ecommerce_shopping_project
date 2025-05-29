import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/collections_provider.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/deals_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/collection_card.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/gridview_product_card_vertical.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/listview_product_card_horizontal.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/listview_product_card_vertical.dart';
import 'package:ecommerce_shopping_project/ui/widgets/sliders/banner_slider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/sliders/deals_slider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_with_text_button.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(popupProvider);

    return Scaffold(
      appBar: const AppBarMain(useShadow: true, useTitle: true),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          children: [
            const BannerSlider(),
            const CollectionTitle(collection: Collections.designer),
            GridviewProductCardVertical(
              itemCountOnRow: 3,
              itemCount: 6,
              provider: collectionsProvider,
              collection: Collections.designer,
            ),
            const DealsSlider(),
            SizedBox(height: Constants.kHomeScreenSpacingBTWItems.h),
            GridviewProductCardVertical(
              itemCountOnRow: 3,
              itemCount: 6,
              startIndex: 9,
              provider: collectionsProvider,
              collection: Collections.designer,
            ),
            const CollectionTitle(collection: Collections.dreamOfSpring),
            const CollectionCard(collection: Collections.dreamOfSpring),
            ListviewProductCardHorizontal(
              provider: collectionsProvider,
              collection: Collections.dreamOfSpring,
              cardHeight: 200,
            ),
            const CollectionTitle(collection: Collections.windsOfWinter),
            GridviewProductCardVertical(
              itemCountOnRow: 3,
              itemCount: 6,
              provider: collectionsProvider,
              collection: Collections.windsOfWinter,
            ),
            const CollectionTitle(collection: Collections.fallEssentials),
            ListviewProductCardVertical(
              itemCount: 5,
              provider: collectionsProvider,
              collection: Collections.fallEssentials,
              isCardElevated: false,
              cardWidth: 400,
            ),
            const CollectionTitle(collection: Collections.summer),
            ListviewProductCardVertical(
              itemCountOnRow: 2,
              itemCount: 5,
              provider: collectionsProvider,
              collection: Collections.summer,
            ),
            SizedBox(height: Constants.kHomeScreenSpacingBTWItems.h),
            const CollectionCard(collection: Collections.summer),
            SizedBox(height: Constants.kMainSpacingEndOfScreen.h),
          ],
        ),
      ),
    );
  }
}
