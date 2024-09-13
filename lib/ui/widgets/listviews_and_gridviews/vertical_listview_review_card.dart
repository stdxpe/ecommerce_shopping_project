import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/reviews_provider.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/ui_general_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/review_card.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_error_horizontal.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_placeholder_horizontal.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class VerticalListviewReviewCard extends ConsumerWidget {
  const VerticalListviewReviewCard({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var card = ref.watch(horizontalCard((
      cardHeight: 300,
      cardWidth: null,
      ctx: context,
    )));

    return SizedBox(
      width: context.mediaQuery.size.width,
      child: ListView.builder(
        shrinkWrap: true,
        clipBehavior: Clip.none,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: ref.watch(reviewsProvider(productId)).value?.length ?? 8,
        itemBuilder: (context, index) {
          return ref.watch(reviewsProvider(productId)).when(
                error: (error, stackTrace) => CardErrorHorizontal(card: card),
                loading: () => CardPlaceholderHorizontal(card: card),
                data: (data) => ReviewCard(review: data[index]),
              );
        },
      ),
    );
  }
}
