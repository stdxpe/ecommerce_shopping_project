import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/models/collection.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/collections_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/card_image.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/error_occured_widget.dart';
import 'package:ecommerce_shopping_project/ui/widgets/placeholders/card_placeholder_standart.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CollectionCard extends ConsumerWidget {
  const CollectionCard({super.key, required this.collection});

  final Collections collection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: Constants.kDetailsSpacingBTWItemsVertical.h,
          left: Constants.kMainPaddingHorizontal.w,
          right: Constants.kMainPaddingHorizontal.w,
        ),
        child: ref.watch(collectionsProvider).when(
              loading: () => CardPlaceholderStandart(
                width: context.mediaQuery.size.width,
                height: context.mediaQuery.size.width,
              ),
              error: (error, stackTrace) => const ErrorOccuredWidget(),
              data: (data) {
                Collection collectionParam =
                    ref.watch(getCollection(collection));
                return GestureDetector(
                  onTap: () => context.push(Routes.collectionDetails,
                      extra: collectionParam),
                  child: CardImage(
                    imageUrl: collectionParam.photo,
                    width: context.mediaQuery.size.width,
                    clipBehavior: Clip.hardEdge,
                    boxfit: BoxFit.fitWidth,
                    decoration: BoxDecoration(
                      color: context.colorPalette.scaffoldBackground,
                      borderRadius:
                          BorderRadius.circular(Constants.kRadiusCardPrimary.r),
                      boxShadow: [
                        BoxShadows.kBoxShadowProductCard(
                          color: context.colorPalette.shadowPrimary,
                        ),
                      ],
                    ),
                  ).animate().fadeIn(duration: 1000.ms, curve: Curves.easeIn),
                );
              },
            ),
      ),
    );
  }
}
