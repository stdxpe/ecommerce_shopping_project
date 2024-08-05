import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/services/dummy_data/dummy_filter_lists.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/horizontal_listview_filter_chips.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_filter_brands.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_filter_range_slider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_filter_size_selector.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_filter_section.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: context.mediaQuery.size.height,
          width: context.mediaQuery.size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Constants.kMainPaddingHorizontal.w),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      const TitleMain(
                        title: AppStrings.filtersScreenTitle,
                        icon: Icons.clear,
                        paddingHorizontal: 0,
                      ),

                      /// TODO: Multi selection or single selection filter chips
                      const TitleFilterSection(
                        title: AppStrings.filtersScreenPriceRange,
                        paddingTop: 0,
                      ),
                      const SwitchFilterRangeSlider(),
                      const TitleFilterSection(
                          title: AppStrings.filtersScreenSortBy),
                      HorizontalListviewFilterChips(filterList: dummySortList),
                      const TitleFilterSection(
                          title: AppStrings.filtersScreenSize),
                      const SwitchFilterSizeSelector(height: 125),
                      // const HorizontalListviewFilterSize(height: 110),
                      // TitleFilterSection(title: AppStrings.filtersScreenColor),
                      // HorizontalListviewFilterColor(height: 110),
                      // TitleFilterSection(title: AppStrings.filtersScreenRating),
                      // HorizontalListviewFilterChips(
                      //   filterList: dummyFilterRating,
                      //   icon: Icons.star,
                      // ),
                      // const TitleFilterSection(
                      //     title: AppStrings.filtersScreenCollections),
                      // HorizontalListviewFilterChips(
                      //   filterList: dummyFilterCollectionList,
                      // ),
                      const TitleFilterSection(
                          title: AppStrings.filtersScreenBrands),
                      VerticalListviewFilterBrands(
                        filterList: dummyBrandList,
                      ),
                      SizedBox(height: 100.h),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: Constants.kButtonPaddingBottom.h,
                    left: Constants.kButtonPaddingHorizontal.w,
                    right: Constants.kButtonPaddingHorizontal.w,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ButtonMain(
                          onPressed: () {},
                          text: AppStrings.filtersScreenButtonClear,
                          backgroundColor: context
                              .colorPalette.buttonMainBackgroundSecondary,
                          foregroundColor: context
                              .colorPalette.buttonMainForegroundSecondary,
                          borderWidth: 2,
                          useShadow: false,
                          paddingHorizontal: 0,
                        ),
                      ),
                      SizedBox(
                          width:
                              Constants.kButtonSpacingBTWButtonsHorizontal.w),
                      Expanded(
                        child: ButtonMain(
                          onPressed: () {},
                          text: AppStrings.filtersScreenButtonApply,
                          paddingHorizontal: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
