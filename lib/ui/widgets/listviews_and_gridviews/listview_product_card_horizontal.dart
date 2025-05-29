import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/collections_provider.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/ui_general_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/product_card_horizontal.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_error_horizontal.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_placeholder_horizontal.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ListviewProductCardHorizontal extends ConsumerWidget {
  const ListviewProductCardHorizontal({
    super.key,
    required this.provider,
    required this.collection,
    this.cardHeight = 400,
    this.isCardElevated = true,
    this.itemCount,
    this.startIndex = 0,
  });

  final AsyncNotifierProvider provider;
  final Collections collection;
  final double? cardHeight;
  final bool? isCardElevated;
  final int? itemCount;
  final int? startIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var card = ref.watch(
        horizontalCard((cardHeight: cardHeight, cardWidth: 700, ctx: context)));

    var collectionIndex = ref.watch(selectedCollectionIndex(collection));

    var count = ref.watch(getCollectionItemCount((
      itemCount: itemCount,
      itemStartIndex: startIndex!,
      provider: provider,
      collectionIndex: collectionIndex,
    )));

    return SizedBox(
      width: context.mediaQuery.size.width,
      height: card.totalHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        clipBehavior: Clip.none,
        padding: EdgeInsets.symmetric(
            horizontal: Constants.kMainPaddingHorizontal.w),
        itemCount: count,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: card.spacingBTWCardsVertical),
            child: ref.watch(provider).when(
                  error: (error, stackTrace) => CardErrorHorizontal(card: card),
                  loading: () => CardPlaceholderHorizontal(card: card),
                  data: (data) {
                    return ProductCardHorizontal(
                      product:
                          data[collectionIndex].products[index + startIndex!],
                      card: card,
                      isCardElevated: isCardElevated,
                    )
                        .animate()
                        .fadeIn(delay: (50 * index).ms, duration: 750.ms);
                  },
                ),
          );
        },
      ),
    );
  }
}
