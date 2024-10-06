import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/collections_provider.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/ui_general_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/product_card_vertical.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_error_vertical.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_placeholder_vertical.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class GridviewProductCardVertical extends ConsumerWidget {
  const GridviewProductCardVertical({
    super.key,
    required this.provider,
    required this.collection,
    this.itemCountOnRow = 3,
    this.itemCount,
    this.isCardElevated = true,
  });

  final AsyncNotifierProvider provider;
  final Collections collection;
  final int itemCountOnRow;
  final bool? isCardElevated;
  final int? itemCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var card = ref.watch(verticalCard(
        (cardWidth: 200, itemCountOnRow: itemCountOnRow, ctx: context)));
    var collectionIndex = ref.watch(selectedCollectionIndex(collection));

    return SizedBox(
      width: context.mediaQuery.size.width,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: Constants.kMainPaddingHorizontal.w,
        ),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: card.totalHeight / card.totalWidth,
          mainAxisExtent: card.totalHeight,
          maxCrossAxisExtent: card.totalWidth,
          mainAxisSpacing: card.spacingBTWCardsVertical,
          crossAxisSpacing: card.spacingBTWCardsHorizontal,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount ??
            ref.watch(provider).value?[collectionIndex].products.length ??
            6,
        itemBuilder: (context, index) {
          return ref.watch(provider).when(
                error: (error, stackTrace) => CardErrorVertical(card: card),
                loading: () => CardPlaceholderVertical(card: card),
                data: (data) {
                  return ProductCardVertical(
                    product: data[collectionIndex].products[index],
                    card: card,
                    isCardElevated: isCardElevated,
                  );
                },
              );
        },
      ),
    );
  }
}
