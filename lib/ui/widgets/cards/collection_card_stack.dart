import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/models/collection.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/card_image.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CollectionCardStack extends StatelessWidget {
  const CollectionCardStack({
    super.key,
    required this.collection,
    this.paddingMain = Constants.kMainPaddingHorizontal,
    required this.textAlignment,
    required this.textPadding,
    required this.textAlign,
  });

  final Collection collection;
  final double? paddingMain;
  final AlignmentGeometry textAlignment;
  final EdgeInsetsGeometry textPadding;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: GestureDetector(
        onTap: () => context.push(Routes.collectionDetails, extra: collection),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingMain!.w),
          child: Stack(
            children: [
              CardImage(
                imageUrl: collection.photo,
                height: context.mediaQuery.size.width - paddingMain!.w * 2,
                width: context.mediaQuery.size.width - paddingMain!.w * 2,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: context.colorPalette.scaffoldBackground,
                  borderRadius: BorderRadius.circular(
                    Constants.kRadiusCardPrimary.r,
                  ),
                  boxShadow: [
                    BoxShadows.kBoxShadowProductCard(
                      color: context.colorPalette.shadowPrimary,
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: textPadding,
                  child: Align(
                    alignment: textAlignment,
                    child: TextCustom(
                      text: collection.title,
                      textStyle: context.textTheme.bodyLarge!,
                      color: context.colorPalette.permaWhiteColor,
                      fontSizeCustom: 90,
                      textAlignCustom: textAlign,
                      fontWeightCustom: FontWeight.w700,
                      fontLetterSpacingCustom: -0.25,
                      boxShadowsCustom: [
                        BoxShadows.kBoxShadowCollectionCardText(
                          color: context.colorPalette.permaBlackColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //  SizedBox(height: Constants.kStackCardSpacingBTWItemsVertical.h),
              //  Positioned.fill(
              //   top: 200.h,
              //   child: Align(
              //     alignment: Alignment.center,
              //     child: TextCustom(
              //       text: collection.subtitle,
              //       textStyle: context.textTheme.bodyMedium!,
              //       fontSizeCustom: 45,
              //       fontWeightCustom: FontWeight.w600,
              //       fontLetterSpacingCustom: 0.5,
              //       color: textColor.withOpacity(0.75),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
