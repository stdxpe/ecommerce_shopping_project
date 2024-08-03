import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/services/navigation_service.dart';
import 'package:ecommerce_shopping_project/models/dummy_data/dummy_collections.dart';
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
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          children: [
            const TitleMain(
              title: AppStrings.discoverScreenTitle,
            ),
            CollectionCardStack(
              textColor: Colors.white,
              collection: dummyCollections[0],
              onPressed: () {
                context.push(Routes.collectionDetails,
                    extra: dummyCollections[0]);
              },
            ),
            SizedBox(height: Constants.kMainSpacingBTWCardsHorizontal.h),
            StaggeredGridCardComponentLeft(
              collection: dummyCollections[1],
              onPressed: () {
                context.push(Routes.collectionDetails,
                    extra: dummyCollections[1]);
              },
            ),
            SizedBox(height: Constants.kMainSpacingBTWCardsHorizontal.h),
            CollectionCardAlternate(
              collection: dummyCollections[2],
              onPressed: () {
                context.push(Routes.collectionDetails,
                    extra: dummyCollections[2]);
              },
              cardHeight: context.mediaQuery.size.height * 0.6,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
