import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/dummy_collection_list.dart';
import 'package:ecommerce_shopping_project/models/dummy_product_list.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/collection_card_alternate.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/collection_card_stack.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/collection_card_staggered.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarMain(),
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            const TitleMain(
              title: AppStrings.discoverScreenTitle,
            ),
            CollectionCardStack(
              onPressed: () {},
              textColor: Colors.white,
              collection: dummyCollectionList[0],
            ),
            SizedBox(height: Constants.kMainSpacingBTWCardsHorizontal.h),
            StaggeredGridCardComponentLeft(
              onPressed: () {},
              productList: dummyProductList,
            ),
            SizedBox(height: Constants.kMainSpacingBTWCardsHorizontal.h),
            CollectionCardAlternate(
              onPressed: () {},
              cardHeight: context.mediaQuery.size.height * 0.6,
              textColor: Colors.black,
              collection: dummyCollectionList[3],
            ),
          ],
        ),
      ),
    );
  }
}
