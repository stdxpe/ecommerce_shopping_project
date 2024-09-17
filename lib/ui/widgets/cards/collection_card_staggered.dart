import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/collection.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/card_image.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:go_router/go_router.dart';

class StaggeredGridCardComponentLeft extends StatelessWidget {
  /// REQUIRES AT LEAST 6 ITEMS
  final Collection collection;
  final double? cardHeight;
  final double? paddingHorizontal;
  final double? betweenElementsPadding;

  const StaggeredGridCardComponentLeft({
    required this.collection,
    this.cardHeight,
    this.paddingHorizontal = Constants.kMainPaddingHorizontal,
    this.betweenElementsPadding = Constants.kMainSpacingBTWCardsHorizontal,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = context.mediaQuery.size;
    double width = (size.width - paddingHorizontal!.w * 2);
    double height = cardHeight ?? (size.width * 0.5);
    // double betweenElements = betweenElementsPadding!.h;
    double betweenElements = 10.w;

    double totalWidth = width - (betweenElements * 3);
    double totalHeight = height - (betweenElements);

    return GestureDetector(
      onTap: () => context.push(Routes.collectionDetails, extra: collection),
      child: Align(
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            // color: Colors.red.withOpacity(0.5),
            color: context.colorPalette.scaffoldBackground,
            borderRadius: BorderRadius.circular(Constants.kRadiusCardSecondary),

            boxShadow: [
              BoxShadow(
                color: Colors.black54.withOpacity(0.35),
                spreadRadius: 0.1,
                blurRadius: 10,
                offset: const Offset(0, 3.5),
              ),
            ],
          ),
          height: height,
          width: width,
          child: Row(
            children: [
              CardImage(
                imageUrl: collection.products[0].mainPhoto,
                height: height,
                width: totalWidth / 4,
              ),
              SizedBox(width: betweenElements),
              CardImage(
                imageUrl: collection.products[1].mainPhoto,
                height: height,
                width: totalWidth / 4,
              ),
              SizedBox(width: betweenElements),
              Column(
                children: [
                  CardImage(
                    imageUrl: collection.products[2].mainPhoto,
                    height: totalHeight / 2,
                    width: totalWidth / 4,
                  ),
                  SizedBox(height: betweenElements),
                  CardImage(
                    imageUrl: collection.products[3].mainPhoto,
                    height: totalHeight / 2,
                    width: totalWidth / 4,
                  ),
                ],
              ),
              SizedBox(width: betweenElements),
              Column(
                children: [
                  CardImage(
                    imageUrl: collection.products[4].mainPhoto,
                    height: totalHeight / 2,
                    width: totalWidth / 4,
                  ),
                  SizedBox(height: betweenElements),
                  CardImage(
                    imageUrl: collection.products[5].mainPhoto,
                    height: totalHeight / 2,
                    width: totalWidth / 4,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
