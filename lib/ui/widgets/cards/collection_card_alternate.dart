import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/collection.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CollectionCardAlternate extends StatelessWidget {
  const CollectionCardAlternate({
    super.key,
    required this.collection,
    required this.onPressed,
    required this.cardHeight,
    required this.textColor,
    this.paddingMain = Constants.kMainPaddingHorizontal,
  });
  final Collection collection;
  final Function onPressed;
  final double cardHeight;
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
          height: cardHeight,
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
          child: Padding(
            padding: EdgeInsets.only(left: 40.w, bottom: 135.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustom(
                  text: collection.subtitle,
                  textStyle: context.textTheme.bodyMedium!,
                  color: textColor.withOpacity(0.75),
                  fontSizeCustom: 45,
                  fontWeightCustom: FontWeight.w600,
                ),
                SizedBox(height: 10.h),
                TextCustom(
                  text: collection.title,
                  textStyle: context.textTheme.bodyLarge!,
                  color: textColor,
                  fontSizeCustom: 87,
                ),
              ],
            ),
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