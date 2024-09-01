import 'package:ecommerce_shopping_project/models/collection.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/collections_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/error_occured_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/services/dummy_data/dummy_all_products.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_collections.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/widgets/app_bars/app_bar_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/gridview_product_card_vertical.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/horizontal_listview_product_card_alternate.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/horizontal_listview_product_card_horizontal.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/horizontal_listview_product_card_stack.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/horizontal_listview_product_card_vertical.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_product_card_horizontal_detailed.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_product_card_horizontal_mini.dart';
import 'package:ecommerce_shopping_project/ui/widgets/sliders/banner_slider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/sliders/product_card_deals_slider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_with_text_button.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

final collections = Provider<List<Collection>>((ref) {
  List<Collection>? collections;
  ref.watch(collectionsProvider).whenData((value) => collections = value);
  return collections ?? [];
});

final collectionsHasError = Provider<bool>((ref) {
  return ref.watch(collectionsProvider).hasError;
});

final collectionsIsLoading = Provider<bool>((ref) {
  var collections = ref.watch(collectionsProvider);
  return ((collections.isLoading ||
      collections.isRefreshing ||
      collections.isReloading));
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final collections = ref.read(collectionsProvider);

    return Scaffold(
      appBar: const AppBarMain(
        useShadow: true,
        useTitle: true,
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          children: [
            GestureDetector(
                onTap: () => context.push(Routes.dialogNewDeals,
                    extra: dummyCollections[2]),
                child: const BannerSlider()),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Listview Vertical',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            // HorizontalListviewProductCardVerticalAlternate(
            //     useShimmer: ref.watch(collectionsIsLoading) ? true : false,

            //     /// TODO: onError prop ref.watch(collectionsHasError)? true : false,
            //     isCardElevated: false,
            //     // productsList: data[0].products,
            //     productsList: ref.watch(collections)[0].products,
            //     cardWidth: 400,
            //     paddingMain: Constants.kMainPaddingHorizontal,
            //     paddingBetweenElements:
            //         Constants.kMainSpacingBTWCardsHorizontal),
            // HorizontalListviewProductCardVerticalAlternate(
            //     useShimmer: (collections.isLoading ||
            //             collections.isRefreshing ||
            //             collections.isReloading)
            //         ? true
            //         : false,
            //     isCardElevated: false,
            //     // productsList: data[0].products,
            //     productsList:
            //         collections.hasValue ? collections.value![0].products : [],
            //     cardWidth: 400,
            //     paddingMain: Constants.kMainPaddingHorizontal,
            //     paddingBetweenElements:
            //         Constants.kMainSpacingBTWCardsHorizontal),
            // switch (collections) {
            //   AsyncError() => const ErrorOccuredWidget(),
            //   AsyncData(:final value) =>
            //     HorizontalListviewProductCardVerticalAlternate(
            //         useShimmer: (collections.isLoading ||
            //                 collections.isRefreshing ||
            //                 collections.isReloading)
            //             ? true
            //             : false,
            //         isCardElevated: false,
            //         // productsList: data[0].products,
            //         productsList: value[0].products,
            //         cardWidth: 400,
            //         paddingMain: Constants.kMainPaddingHorizontal,
            //         paddingBetweenElements:
            //             Constants.kMainSpacingBTWCardsHorizontal),
            //   _ => const CircularProgressIndicator(),
            // },

            ref.watch(collectionsProvider).when(
                  loading: () =>
                      const HorizontalListviewProductCardVerticalAlternate(
                          useShimmer: true,
                          productsList: [],
                          cardWidth: 400,
                          paddingMain: Constants.kMainPaddingHorizontal,
                          paddingBetweenElements:
                              Constants.kMainSpacingBTWCardsHorizontal),
                  error: (error, stackTrace) => const ErrorOccuredWidget(),
                  data: (data) {
                    var list = data[3].products;
                    list.shuffle();
                    return HorizontalListviewProductCardVerticalAlternate(
                        useShimmer: false,
                        isCardElevated: false,
                        // productsList: data[0].products,
                        productsList: list,
                        cardWidth: 400,
                        paddingMain: Constants.kMainPaddingHorizontal,
                        paddingBetweenElements:
                            Constants.kMainSpacingBTWCardsHorizontal);
                  },
                ),

            // HorizontalListviewProductCardVerticalAlternate(
            //   // useShimmer: true,
            //   isCardElevated: false,
            //   productsList: dummyAllProducts,
            //   cardWidth: 400,
            //   paddingMain: Constants.kMainPaddingHorizontal,
            //   paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            // ),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Listview Horizontal',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            HorizontalListviewProductCardHorizontal(
              useShimmer: true,
              // isCardElevated: false,
              productsList: dummyAllProducts,
              cardWidth: 700,
              cardHeight: 200,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Listview Horizontal Mini',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            VerticalListviewProductCardHorizontalMini(
              useShimmer: true,
              // isCardElevated: false,
              productsList: dummyAllProducts,
              cardHeight: 200,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: AppStrings.dealsOfTheWeek,
              buttonText: '',
            ),
            ProductCardDealsSlider(
              /// HERE
              // productsList: dummyDealsOfTheWeekProductList,
              productsList: dummyAllProducts,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Listview Horizontal Detailed',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            VerticalListviewProductCardHorizontalDetailed(
              useShimmer: true,
              useItemCounter: false,
              isCardElevated: false,
              productsList: dummyAllProducts,
              cardHeight: 300,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Listview Vertical',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            HorizontalListviewProductCardVertical(
              useShimmer: true,
              // isCardElevated: false,
              productsList: dummyAllProducts,
              itemCountOnRow: 2,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Listview Stack',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            HorizontalListviewProductCardStack(
              useShimmer: true,
              productsList: dummyAllProducts,
              cardWidth: 500,
              paddingMain: Constants.kMainPaddingHorizontal,
              paddingBetweenElements: Constants.kMainSpacingBTWCardsHorizontal,
            ),
            TitleWithTextButton(
              onPressed: () {},
              title: 'Gridview Vertical Card',
              buttonText: AppStrings.collectionTitleRightButton,
            ),
            GridviewProductCardVertical(
              useShimmer: true,
              isCardElevated: false,
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
