import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/dummy_data/dummy_products.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/gridview_product_card_vertical.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CollectionDetailsScreen extends StatelessWidget {
  const CollectionDetailsScreen({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const AppBarMain(),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          children: [
            Container(
              height: context.mediaQuery.size.width,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    product.mainPhoto,
                  ),
                ),
              ),
            ),
            TitleMain(
              title: 'Women\'s Collection',
              itemCount: 13,
              icon: Icons.tune,
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
                text:
                    'Maxwel welted sole  construction delivers exceptional and and durability, and is Maxwel welted sole ended construction and delivers exceptional durability, and',
                textStyle: context.textTheme.displayMedium!,
                color: context.colorPalette.text,
                maxLines: 3,
                isHeightConstraintRelated: false,
              ),
            ),
            SizedBox(height: Constants.kDetailsScreenSpacingBTWItemsVertical.h),
            GridviewProductCardVertical(
              // isCardElevated: false,
              productsList: dummyProducts,
              itemCountOnRow: 3,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            ),
          ],
        ),
      ),
    );
  }
}
