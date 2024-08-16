import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/cart_feature_selector_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/horizontal_listview_filter_color.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/horizontal_listview_filter_size.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_filter_section.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class BottomSheetFeatureSelector extends StatelessWidget {
  const BottomSheetFeatureSelector({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Constants.kMainPaddingHorizontal.w),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const ClampingScrollPhysics(),
              children: [
                const TitleFilterSection(title: AppStrings.filtersScreenSize),
                HorizontalListviewFilterSize(list: product.sizes),
                const TitleFilterSection(title: AppStrings.filtersScreenColor),
                HorizontalListviewFilterColor(list: product.colors),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: Constants.kButtonPaddingBottom.h,
              left: Constants.kButtonPaddingHorizontal.w,
              right: Constants.kButtonPaddingHorizontal.w,
            ),
            child: Consumer(
              builder: (context, ref, child) => Row(
                children: [
                  Expanded(
                    child: ButtonMain(
                      onPressed: () => ref.read(
                          featureSelectorOnPressedProvider(product).future),
                      text: AppStrings.detailsScreenButtonAddToShoppingCart,
                      backgroundColor:
                          context.colorPalette.buttonMainBackgroundSecondary,
                      foregroundColor:
                          context.colorPalette.buttonMainForegroundSecondary,
                      borderWidth: 2,
                      useShadow: false,
                      paddingHorizontal: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
