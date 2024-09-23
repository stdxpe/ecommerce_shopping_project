import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/ui_general_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/order_card_horizontal.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/error_occured_widget.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/no_items_found_widget.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_error_horizontal.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_placeholder_horizontal.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ListviewOrderCardHorizontal extends ConsumerWidget {
  const ListviewOrderCardHorizontal({super.key, required this.provider});

  final AsyncNotifierProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var card = ref.watch(
        horizontalCard((cardHeight: null, cardWidth: null, ctx: context)));

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
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: card.spacingBTWCardsVertical * 0.5),
                              child: OrderCardHorizontal(
                                cardHeight: 200,
                                order: data[index],
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
