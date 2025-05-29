import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/shopping_cart_providers.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/ui_general_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/product_card_horizontal_detailed.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/dismissible_delete_widget.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/error_occured_widget.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/no_items_found_widget.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_error_horizontal.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_placeholder_horizontal.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_item_counter.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ListviewProductCardHorizontalDetailed extends ConsumerWidget {
  const ListviewProductCardHorizontalDetailed({
    super.key,
    required this.provider,
    this.cardHeight = 300,
    this.dismissibleEnabled = false,
    this.useItemCounter = false,
    this.enableNavigation = true,
  });

  final AsyncNotifierProvider provider;
  final double cardHeight;
  final bool? dismissibleEnabled;
  final bool? useItemCounter;
  final bool? enableNavigation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cardHorizontalDetailed = ref
        .watch(horizontalDetailedCard((cardHeight: cardHeight, ctx: context)));

    var card = ref.watch(horizontalCard(
        (cardHeight: cardHeight, cardWidth: null, ctx: context)));

    return SizedBox(
      width: context.mediaQuery.size.width,
      child: ref.watch(provider).hasError
          ? const ErrorOccuredWidget()
          : (ref.watch(provider).value != null &&
                  ref.watch(provider).value?.isNotEmpty)
              ? ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  clipBehavior: Clip.none,
                  padding: EdgeInsets.symmetric(
                      horizontal: Constants.kMainPaddingHorizontal.w,
                      vertical: 0),
                  itemCount: ref.watch(provider).value?.length ?? 3,
                  itemBuilder: (context, index) {
                    return ref.watch(provider).when(
                          error: (error, stackTrace) =>
                              CardErrorHorizontal(card: card),
                          loading: () => CardPlaceholderHorizontal(card: card),
                          data: (data) {
                            return DismissibleDeleteWidget(
                              dismissibleEnabled: dismissibleEnabled,
                              height: cardHeight,
                              uniqueKey: data[index].id,
                              onDismissed: () => ref
                                  .read(shoppingCartProvider.notifier)
                                  .deleteProductFromShoppingCart(
                                      cartProduct: data[index]),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        card.spacingBTWCardsVertical * 0.5),
                                child: Stack(
                                  children: [
                                    ProductCardHorizontalDetailed(
                                      cartProduct: data[index],
                                      card: cardHorizontalDetailed,
                                      useItemCounter: useItemCounter,
                                      enableNavigation: enableNavigation,
                                    ),
                                    if (useItemCounter!)
                                      Positioned.fill(
                                        right: 25.w,
                                        bottom: 10.h,
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: SwitchItemCounter(
                                            itemCount: data[index].itemCount,
                                            onPressedDecrease: () => ref
                                                .read(shoppingCartProvider
                                                    .notifier)
                                                .decreaseItemCounter(
                                                    cartProduct: data[index]),
                                            onPressedIncrease: () => ref
                                                .read(shoppingCartProvider
                                                    .notifier)
                                                .increaseItemCounter(
                                                    cartProduct: data[index]),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                  },
                )
              : const NoItemsFoundWidget(),
    );
  }
}
