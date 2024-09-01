import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/search_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_search_field.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_product_card_horizontal_mini.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/error_occured_widget.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_placeholder_listview.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            itemCount:
                ref.watch(searchProvider.notifier).getFoundProductsCount(),
            icon: Icons.tune,
            onPressed: () {
              context.focusScope.unfocus();
              context.push(Routes.bottomSheetFilters);
            },
          ),
          ref.watch(searchProvider).when(
              loading: () =>
                  const CardPlaceholderListView(cardHeight: 200, itemCount: 6),
              error: (error, stackTrace) => const ErrorOccuredWidget(),
              data: (data) => VerticalListviewProductCardHorizontalMini(
                    productsList: data,
                    useSoftShadow: true,
                    cardHeight: 200,
                    paddingMain: Constants.kMainPaddingHorizontal,
                    paddingBetweenElements:
                        Constants.kMainSpacingBTWCardsHorizontal,
                  )),
          SizedBox(height: Constants.kMainSpacingEndOfScreen.h),
        ],
      ),
    );
  }
}
