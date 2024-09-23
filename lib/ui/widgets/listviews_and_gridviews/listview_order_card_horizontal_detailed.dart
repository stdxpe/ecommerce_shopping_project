import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/order.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/ui_general_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/cards/order_card_horizontal_detailed.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/no_items_found_widget.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ListviewOrderCardHorizontalDetailed extends ConsumerWidget {
  const ListviewOrderCardHorizontalDetailed({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var card =
        ref.watch(horizontalDetailedCard((cardHeight: 240, ctx: context)));

    return SizedBox(
      width: context.mediaQuery.size.width,
      child: order.products.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              clipBehavior: Clip.none,
              padding: EdgeInsets.symmetric(
                  horizontal: Constants.kMainPaddingHorizontal.w, vertical: 0),
              itemCount: order.products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Constants.kMainSpacingBTWCardsVertical.w * 0.6),
                  child: OrderCardHorizontalDetailed(
                    orderProduct: order.products[index],
                    card: card,
                  ),
                );
              },
            )
          : const NoItemsFoundWidget(),
    );
  }
}
