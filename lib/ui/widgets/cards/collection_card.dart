import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/models/collection.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/card_image.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CollectionCard extends StatelessWidget {
  const CollectionCard({super.key, required this.collection});

  final Collection collection;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: GestureDetector(
        onTap: () => context.push(Routes.collectionDetails, extra: collection),
        child: CardImage(
          imageUrl: collection.photo,
          width: context.mediaQuery.size.width,
          clipBehavior: Clip.hardEdge,
          boxfit: BoxFit.fitWidth,
          decoration: BoxDecoration(
            color: context.colorPalette.scaffoldBackground,
            borderRadius: BorderRadius.circular(Constants.kRadiusCardPrimary.r),
            boxShadow: [
              BoxShadows.kBoxShadowProductCard(
                color: context.colorPalette.shadowPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
