import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/collections_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CollectionTitle extends ConsumerWidget {
  const CollectionTitle({super.key, required this.collection});

  final Collections collection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
        top: Constants.kMainTitlePaddingTopForHomeScreen.h,
        bottom: Constants.kMainTitlePaddingBottom.h,
        left: Constants.kMainPaddingHorizontal.w,
        right: Constants.kMainPaddingHorizontal.w,
      ),
      child: GestureDetector(
        onTap: () => context.push(
          Routes.collectionDetails,
          extra: ref.watch(getCollection(collection)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              flex: 9,
              child: TextCustom(
                text: ref.watch(getCollectionTitle(collection)),
                textStyle: context.textTheme.titleLarge!,
                color: context.colorPalette.title,
                isHeightConstraintRelated: false,
              ),
            ),
            Flexible(
              flex: 2,
              child: TextCustom(
                text: AppStrings.collectionTitleRightButton,
                textStyle: context.textTheme.titleMedium!,
                color: context.colorPalette.textButtonFaded,
                textAlignCustom: TextAlign.end,
                fontSizeCustom: 34,
                fontWeightCustom: FontWeight.w500,
                isHeightConstraintRelated: false,
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 750.ms);
  }
}
