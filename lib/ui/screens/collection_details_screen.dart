import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

import 'package:ecommerce_shopping_project/models/deprecated/collection.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_all_products.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/gridview_product_card_vertical.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CollectionDetailsScreen extends ConsumerWidget {
  const CollectionDetailsScreen({
    super.key,
    required this.collection,
  });

  final Collection collection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppBarMain(
        automaticallyImplyLeading: true,
        useSearchButton: false,
        useShadow: true,
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          children: [
            ZoomOverlay(
              modalBarrierColor: Colors.black12,
              minScale: 0.5,
              maxScale: 3.0,
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: const Duration(
                milliseconds: 300,
              ),
              twoTouchOnly: true,
              onScaleStart: () {},
              onScaleStop: () {},
              child: Container(
                height: context.mediaQuery.size.width,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      collection.photo,
                    ),
                  ),
                ),
              ),
            ),
            TitleMain(
              title: collection.title,
              itemCount: collection.products.length,
              icon: Icons.tune,
              onPressed: () => context.push(Routes.bottomSheetFilters),
              // paddingHorizontal:
              //     Constants.kDetailsScreenMainPaddingHorizontal.w,
              paddingTop: 77.h,
              paddingBottom: 77.h,
            ),
            // SizedBox(
            //     height: Constants
            //         .kCollectionDetailsScreenSpacingBTWItemsVertical.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Constants.kDetailsScreenMainPaddingHorizontal.w,
              ),
              child: TextCustom(
                text: collection.subtitle,
                textStyle: context.textTheme.displayMedium!,
                color: context.colorPalette.text,
                maxLines: 3,
                isHeightConstraintRelated: false,
              ),
            ),
            SizedBox(height: Constants.kDetailsScreenSpacingBTWItemsVertical.h),
            GridviewProductCardVertical(
              // isCardElevated: false,
              productsList: dummyAllProducts,
              itemCountOnRow: 3,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            ),
            SizedBox(height: Constants.kMainSpacingEndOfScreen.h),
          ],
        ),
      ),
    );
  }
}
