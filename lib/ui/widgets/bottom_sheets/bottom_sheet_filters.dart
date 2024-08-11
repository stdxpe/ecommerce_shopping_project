import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/services/dummy_data/dummy_filter_lists.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/filter_selector_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_buttons_filters_apply_or_clear.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/horizontal_listview_filter_chips.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_filter_brands.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_filter_range_slider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_filter_size_selector.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_filter_section.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class BottomSheetFilters extends StatelessWidget {
  const BottomSheetFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.mediaQuery.size.height,
        width: context.mediaQuery.size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Constants.kMainPaddingHorizontal.w * 2,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const ClampingScrollPhysics(),
                  clipBehavior: Clip.none,
                  children: [
                    TitleMain(
                      title: AppStrings.filtersScreenTitle,
                      icon: Icons.clear,
                      onPressed: () => context.pop(),
                      paddingHorizontal: 0,
                      paddingTop: Constants.kMainTitlePaddingTopForHomeScreen.h,
                    ),
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
                    SwitchFilterSizeSelector(list: dummySizeList, height: 125),
                    const TitleFilterSection(
                        title: AppStrings.filtersScreenBrands),
                    VerticalListviewFilterBrands(
                      list: dummyBrandList,
                    ),
                    SizedBox(height: 100.h),
                  ],
                ),
              ),
              Consumer(
                builder: (context, ref, child) =>
                    BottomSheetButtonsFiltersApplyOrClear(
                  onPressedApply: () {
                    ref
                        .read(filterAllProviders.notifier)
                        .getAllFilterSelections(ref);
                    context.pop();
                  },
                  onPressedClear: () {
                    ref.read(filterAllProviders.notifier).resetAllFilters(ref);
                    context.pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
