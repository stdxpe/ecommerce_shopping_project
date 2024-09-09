import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/wishlist_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/listview_product_card_horizontal_mini.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppBarMain(),
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        children: [
          TitleMain(
            title: AppStrings.wishlistScreenTitle,
            itemCount: ref.watch(wishlistProvider).value?.length ?? 0,
          ),
          ListviewProductCardHorizontalMini(
            provider: wishlistProvider,
            dismissibleEnabled: true,
          ),
          SizedBox(height: Constants.kMainSpacingEndOfScreen.h),
        ],
      ),
    );
  }
}
