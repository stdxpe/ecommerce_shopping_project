import 'package:ecommerce_shopping_project/ui/riverpod_providers/bottom_sheet_providers.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/search_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_placeholder_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/services/dummy_data/dummy_all_products.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_search_field.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_product_card_horizontal_mini.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBarSearchField(
        searchOnPressed: (query) {
          context.focusScope.unfocus();
          ref.read(searchProvider.notifier).getProductsByQuery(query);
        },
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        children: [
          TitleMain(
            title: AppStrings.searchScreenTitle,
            itemCount:
                ref.watch(searchProvider.notifier).getFoundProductCount(),
            icon: Icons.tune,
            onPressed: () {
              context.focusScope.unfocus();
              ref.read(bottomSheetProvider.notifier).filters(context: context);
            },
          ),
          ref.watch(searchProvider).when(
              loading: () => const CardPlaceholderListView(cardHeight: 200),
              error: (error, stackTrace) => const Text(
                    AppStrings.globalStateErrorMessage,
                    style: TextStyle(color: Colors.black),
                  ),
              data: (data) =>
                  // (data.isNotEmpty)
                  //     ?
                  VerticalListviewProductCardHorizontalMini(
                    productsList: data,
                    useSoftShadow: true,
                    cardHeight: 200,
                    paddingMain: Constants.kMainPaddingHorizontal,
                    paddingBetweenElements:
                        Constants.kMainSpacingBTWCardsHorizontal,
                  )
              // : const Icon(Icons.face),
              ),
          // VerticalListviewProductCardHorizontalMini(
          //   // isCardElevated: false,
          //   useSoftShadow: true,

          //   /// TODO: This list gotta come from Riverpod Search Functionality methods
          //   // productsList: dummyProductShortList,
          //   productsList: dummyAllProducts,
          //   cardHeight: 200,
          //   paddingMain: Constants.kMainPaddingHorizontal,
          //   paddingBetweenElements:
          //       Constants.kMainSpacingBTWCardsHorizontal * 1.5,
          // ),
        ],
      ),
    );
  }
}
