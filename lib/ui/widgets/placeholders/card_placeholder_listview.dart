import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_placeholder_horizontal.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CardPlaceholderListView extends ConsumerWidget {
  const CardPlaceholderListView({
    super.key,
    required this.cardHeight,
    this.itemCount = 3,
    this.useTopSpacingForExpandingTitle = true,
    this.paddingMain,
    this.paddingBetweenElements,
  });

  final double cardHeight;
  final int? itemCount;
  final bool? useTopSpacingForExpandingTitle;
  final double? paddingMain;
  final double? paddingBetweenElements;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double paddingMain = this.paddingMain ?? Constants.kMainPaddingHorizontal;
    double paddingBetweenElements =
        this.paddingBetweenElements ?? Constants.kMainSpacingBTWCardsVertical;
    return SizedBox(
      child: ListView.builder(
        padding: EdgeInsets.only(
            top: useTopSpacingForExpandingTitle!
                ? Constants.kMainTitleSpacingBTWItemsFoundBTWStepsVertical.h +
                    context.textTheme.titleSmall!.fontSize!.h
                : 0),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        clipBehavior: Clip.none,
        itemCount: itemCount,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: paddingBetweenElements.w / 2,
              top: paddingBetweenElements.w / 2,
              left: paddingMain.w,
              right: paddingMain.w,
            ),
            child: CardPlaceholderHorizontal(
              cardHeight: cardHeight,
              cardWidth: context.mediaQuery.size.width,
            ),
          );
        },
      ),
    );
  }
}
