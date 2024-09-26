import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/collections_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/collection_card_alternate.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/collection_card_stack.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/collection_card_staggered.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/gridview_product_card_vertical.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/listview_product_card_horizontal.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/card_image.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

/// TODO: Listview range for 3 to 6 in Providers
class DiscoverScreen extends ConsumerWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // appBar: const AppBarMain(),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          children: [
            TitleMain(
              title: AppStrings.discoverScreenTitle,
              icon: UniconsLine.search,
              iconSize: 60,
              paddingTop: Constants.kMainTitlePaddingTopWithoutAppBar.h,
              paddingRight: 13,
              onPressed: () => context.go(Routes.search),
            ),
            CollectionCardAlternate(
              collection: ref.watch(collectionsProvider).value![4],
              cardHeight: context.mediaQuery.size.height * 0.59,
              textColor: Colors.white,
            ),
            SizedBox(height: Constants.kMainSpacingBTWCardsVertical.h * 2),
            GridviewProductCardVertical(
              itemCountOnRow: 2,
              isCardElevated: false,
              provider: collectionsProvider,
              collection: Collections.spring,
            ),
            SizedBox(height: Constants.kMainSpacingBTWCardsVertical.h * 2),
            CollectionCardStack(
              collection: ref.watch(collectionsProvider).value![0],
              textPadding: const EdgeInsets.only(bottom: 0, right: 0),
              textAlign: TextAlign.center,
              textAlignment: Alignment.center,
            ),
            SizedBox(height: Constants.kMainSpacingBTWCardsVertical.h),
            StaggeredGridCardComponentLeft(
              // collection: dummyCollections[1],
              collection: ref.watch(collectionsProvider).value![3],
            ),
            SizedBox(height: Constants.kMainSpacingBTWCardsVertical.h),
            CollectionCardStack(
              collection: ref.watch(collectionsProvider).value![1],
              textPadding: EdgeInsets.zero,
              textAlign: TextAlign.center,
              textAlignment: Alignment.center,
            ),
            SizedBox(height: Constants.kMainSpacingBTWCardsVertical.h),
            ListviewProductCardHorizontal(
              provider: collectionsProvider,
              collection: Collections.winter,
              // isCardElevated: false,
              cardHeight: 200,
            ),
            SizedBox(height: Constants.kMainSpacingBTWCardsVertical.h * 3),
            CollectionCardStack(
              collection: ref.watch(collectionsProvider).value![2],
              textPadding: const EdgeInsets.only(bottom: 15, right: 20),
              textAlign: TextAlign.right,
              textAlignment: Alignment.bottomRight,
            ),
            SizedBox(height: Constants.kMainSpacingBTWCardsVertical.h),
            CollectionCardStack(
              collection: ref.watch(collectionsProvider).value![3],
              textPadding: const EdgeInsets.only(bottom: 15, right: 20),
              textAlign: TextAlign.right,
              textAlignment: Alignment.bottomRight,
            ),
            SizedBox(height: Constants.kMainSpacingBTWCardsVertical.h),
            SizedBox(height: Constants.kMainSpacingBTWCardsVertical.h),
            SizedBox(height: Constants.kMainSpacingBTWCardsVertical.h),
            Column(
              children: [
                Row(
                  children: [
                    CardImage(
                        imageUrl:
                            ref.watch(collectionsProvider).value![3].photo,
                        height: context.mediaQuery.size.width * 0.5,
                        width: context.mediaQuery.size.width * 0.5),
                    CardImage(
                        imageUrl:
                            ref.watch(collectionsProvider).value![1].photo,
                        height: context.mediaQuery.size.width * 0.5,
                        width: context.mediaQuery.size.width * 0.5),
                  ],
                ),
                Row(
                  children: [
                    CardImage(
                        imageUrl:
                            ref.watch(collectionsProvider).value![0].photo,
                        height: context.mediaQuery.size.width * 0.5,
                        width: context.mediaQuery.size.width * 0.5),
                    CardImage(
                        imageUrl:
                            ref.watch(collectionsProvider).value![2].photo,
                        height: context.mediaQuery.size.width * 0.5,
                        width: context.mediaQuery.size.width * 0.5),
                  ],
                ),
              ],
            ),
            SizedBox(height: Constants.kMainSpacingBTWCardsVertical.h),
            SizedBox(height: Constants.kMainSpacingBTWCardsVertical.h),
            SizedBox(height: Constants.kMainSpacingBTWCardsHorizontal.h),
            SizedBox(height: Constants.kMainSpacingEndOfScreen.h),
          ],
        ),
      ),
    );
  }
}
