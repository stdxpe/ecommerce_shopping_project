import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/models/collection.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/card_image.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CollectionCardAlternate extends StatelessWidget {
  const CollectionCardAlternate({
    super.key,
    required this.collection,
    required this.cardHeight,
    required this.textColor,
    this.paddingMain = Constants.kMainPaddingHorizontal,
  });
  final Collection collection;
  final double cardHeight;
  final Color textColor;
  final double? paddingMain;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(Routes.collectionDetails, extra: collection),
      child: Container(
        width: context.mediaQuery.size.width,
        height: cardHeight,
        padding: EdgeInsets.symmetric(horizontal: paddingMain!.w),
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                // alignment: Alignment.topCenter,
                child: CardImage(
                  imageUrl: collection.photo,
                  alignment: Alignment.center,
                  boxfit: BoxFit.cover,
                  height: cardHeight,
                  clipBehavior: Clip.hardEdge,
                  width: context.mediaQuery.size.width,
                  decoration: BoxDecoration(
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
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 40.w, bottom: 140.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom(
                        text: collection.subtitle,
                        textStyle: context.textTheme.bodyMedium!,
                        color: textColor.withOpacity(0.75),
                        fontSizeCustom: 40,
                        fontWeightCustom: FontWeight.w600,
                      ),
                      SizedBox(height: 12.5.h),
                      TextCustom(
                        text: collection.title,
                        textStyle: context.textTheme.bodyLarge!,
                        color: textColor,
                        fontSizeCustom: 76,
                        fontLetterSpacingCustom: -0.5,
                        fontWeightCustom: FontWeight.w700,
                        textAlignCustom: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// GestureDetector(
//       onTap: () {
//         onPressed();
//       },
//       child: Align(
//         child: Container(
//           clipBehavior: Clip.hardEdge,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(
//               Constants.kRadiusCardPrimary.r,
//             ),
//             boxShadow: [
//               BoxShadows.kBoxShadowProductCard(
//                 color: context.colorPalette.shadowPrimary,
//               ),
//             ],
//           ),
//           child: Container(
//             height: cardHeight,
//             width: cardHeight,
//             padding: EdgeInsets.only(
//               top: Constants.kStackCardPaddingVertical.h,
//               bottom: Constants.kStackCardPaddingVertical.h,
//               left: Constants.kStackCardPaddingHorizontal.w,
//               right: Constants.kStackCardPaddingHorizontal.w,
//             ),
//             decoration: BoxDecoration(
//               // color: Colors.green.withOpacity(0.5),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage(
//                   collection.imageUrl,
//                 ),
//               ),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     TextCustom(
//                       text: collection.title,
//                       textStyle: context.textTheme.bodyLarge!,
//                       color: context.colorPalette.cardTextPrimary,
//                       maxLines: 2,
//                       isHeightConstraintRelated: false,
//                     ),
//                     SizedBox(
//                         height: Constants.kStackCardSpacingBTWItemsVertical.h),
//                     TextCustom(
//                       text: collection.subtitle,
//                       textStyle: context.textTheme.bodyMedium!,
//                       color: context.colorPalette.cardTextSecondary,
//                     ),
//                   ],
//                 ),
//                 if (collection.description != null)
//                   TextCustom(
//                     text: collection.description!,
//                     textStyle: context.textTheme.bodySmall!,
//                     color: context.colorPalette.cardTextTertiary,
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );