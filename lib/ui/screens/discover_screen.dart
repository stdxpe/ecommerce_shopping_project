import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/collections_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/collection_card.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/discover_card.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/gridview_product_card_vertical.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/listview_product_card_horizontal.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class DiscoverScreen extends ConsumerWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: Constants.kMainPaddingHorizontal.w),
          physics: const ClampingScrollPhysics(),
          children: [
            TitleMain(
              title: AppStrings.discoverScreenTitle,
              icon: UniconsLine.search,
              iconSize: 60,
              paddingTop: Constants.kMainTitleTopPaddingWithoutAppBar.h,
              paddingRight: 13,
              onPressed: () => context.go(Routes.search),
            ),
            CollectionCard(
              collection: ref.watch(getCollection(Collections.designer)),
            ),
            CollectionCard(
              collection: ref.watch(getCollection(Collections.windsOfWinter)),
            ),
            ListviewProductCardHorizontal(
              provider: collectionsProvider,
              collection: Collections.windsOfWinter,
              cardHeight: 200,
              itemCount: 20,
              startIndex: 2,
            ),
            SizedBox(height: Constants.kDetailsSpacingBTWItemsVertical.h),
            const DiscoverCard(photo: AppImages.discoverCardFemininity),
            const DiscoverCard(photo: AppImages.discoverCardRedBox),
            GridviewProductCardVertical(
              itemCountOnRow: 2,
              itemCount: 2,
              isCardElevated: false,
              provider: collectionsProvider,
              collection: Collections.dreamOfSpring,
            ),
            SizedBox(height: Constants.kDetailsSpacingBTWItemsVertical.h),
            CollectionCard(
              collection: ref.watch(getCollection(Collections.dreamOfSpring)),
            ),
            CollectionCard(
              collection: ref.watch(getCollection(Collections.fallEssentials)),
            ),
            GridviewProductCardVertical(
              itemCountOnRow: 3,
              isCardElevated: true,
              provider: collectionsProvider,
              collection: Collections.fallEssentials,
            ),
            SizedBox(height: Constants.kDetailsSpacingBTWItemsVertical.h),
            CollectionCard(
              collection: ref.watch(getCollection(Collections.summer)),
            ),
            SizedBox(height: Constants.kMainSpacingEndOfScreen.h),
          ],
        ),
      ),
    );
  }
}
