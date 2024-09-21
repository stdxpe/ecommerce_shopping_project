import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

import 'package:ecommerce_shopping_project/models/collection.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/collections_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/gridview_product_card_vertical.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/card_image.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CollectionDetailsScreen extends ConsumerWidget {
  const CollectionDetailsScreen({super.key, required this.collection});

  final Collection collection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var collectionEnum = ref.watch(getCollectionEnum(collection.title));

    return Container(
      color: context.colorPalette.scaffoldBackground,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBarMain(
            iconsColor: context.colorPalette.permaBlackColor,
            useTransparentBackground: true,
            automaticallyImplyLeading: true,
            useSearchButton: false,
          ),
          body: ListView(
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
                child: CardImage(
                  imageUrl: collection.photo,
                  width: context.mediaQuery.size.width,
                  height: context.mediaQuery.size.width * 0.8,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: context.colorPalette.scaffoldBackground),
                ),
              ),
              TitleMain(
                title: collection.title,
                // itemCount: collection.products.length,

                paddingTop: 55.h,
                // paddingBottom: 77.h,
                paddingBottom: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Constants.kMainPaddingHorizontal.w,
                ),
                child: TextCustom(
                  text: collection.subtitle,
                  textStyle: context.textTheme.displayMedium!,
                  color: context.colorPalette.text,
                  maxLines: 3,
                  isHeightConstraintRelated: false,
                ),
              ),
              SizedBox(
                  height: Constants.kDetailsScreenSpacingBTWItemsVertical.h),
              GridviewProductCardVertical(
                itemCountOnRow: 3,
                provider: collectionsProvider,
                collection: collectionEnum,
              ),
              SizedBox(height: Constants.kMainSpacingEndOfScreen.h),
            ],
          ),
        ),
      ),
    );
  }
}
