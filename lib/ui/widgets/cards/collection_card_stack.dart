import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/deprecated/collection.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CollectionCardStack extends StatelessWidget {
  const CollectionCardStack({
    super.key,
    required this.collection,
    required this.onPressed,
    required this.textColor,
    this.paddingMain = Constants.kMainPaddingHorizontal,
  });
  final Collection collection;
  final Function onPressed;
  final Color textColor;
  final double? paddingMain;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Align(
        child: Container(
          height: context.mediaQuery.size.width - paddingMain! * 2.w,
          width: context.mediaQuery.size.width - paddingMain! * 2.w,
          margin: EdgeInsets.symmetric(horizontal: paddingMain!.w),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                collection.photo,
              ),
            ),
            borderRadius: BorderRadius.circular(
              Constants.kRadiusCardPrimary.r,
            ),
            boxShadow: [
              BoxShadows.kBoxShadowProductCard(
                color: context.colorPalette.shadowPrimary,
              ),
            ],
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: TextCustom(
                  text: collection.title,
                  textStyle: context.textTheme.bodyLarge!,
                  color: textColor,
                  fontSizeCustom: 100,
                ),
              ),
              Positioned.fill(
                top: 200.h,
                child: Align(
                  alignment: Alignment.center,
                  child: TextCustom(
                    text: collection.subtitle,
                    textStyle: context.textTheme.bodyMedium!,
                    fontSizeCustom: 45,
                    fontWeightCustom: FontWeight.w600,
                    fontLetterSpacingCustom: 0.5,
                    color: textColor.withOpacity(0.75),
                  ),
                ),
              ),
            ],
          ),
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