import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/filter_provider.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/search_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_search_field.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/listview_searched_product_card_mini.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(disposeFilters);

    return Scaffold(
      appBar: AppBarSearchField(
        searchOnPressed: () {
          context.focusScope.unfocus();
          ref.read(searchProvider.notifier).getProductsByFilter();
        },
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        children: [
          SizedBox(height: Constants.kMainTitlePaddingTop.h),
          TitleMain(
            title: AppStrings.searchScreenTitle,
            icon: Icons.tune,
            itemCount:
                ref.watch(searchProvider.notifier).getFoundProductsCount(),
            onPressed: () {
              context.focusScope.unfocus();
              context.push(Routes.bottomSheetFilters);
            },
          ),
          ListviewSearchedProductCardMini(provider: searchProvider),
          SizedBox(height: Constants.kMainSpacingEndOfScreen.h),
        ],
      ),
    );
  }
}
