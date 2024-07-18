import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProfileCardButton extends StatelessWidget {
  const ProfileCardButton({
    super.key,
    required this.buttonText,
    this.icon,
    this.useBackIcon = true,
    this.widget,
    required this.cardWidth,
    required this.cardHeight,
    required this.fontSizePrimary,
    required this.paddingCardHorizontal,
    required this.paddingBetweenHorizontal,
  });

  final String buttonText;
  final IconData? icon;
  final bool? useBackIcon;
  final Widget? widget;
  final double cardWidth;
  final double cardHeight;
  final double fontSizePrimary;
  final double paddingCardHorizontal;
  final double paddingBetweenHorizontal;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            Constants.kRadiusCardPrimary.r,
          ),
        ),
        child: Card(
          margin: EdgeInsets.zero,
          // color: Colors.white,
          color: ColorPalette.sheetBackground,
          clipBehavior: Clip.hardEdge,
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ),
          elevation: 1,

          /// TOTAL CARD
          child: Container(
            // color: Colors.green.withOpacity(0.5),
            height: cardHeight.h,
            width: cardWidth.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    // color: Colors.red.withOpacity(0.5),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: paddingCardHorizontal.w,
                    ),
                    height: cardHeight.h,
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // color: Colors.blue.withOpacity(0.5),
                          alignment: Alignment.center,
                          height: cardHeight.h * 0.5,
                          width: cardHeight.h * 0.5,
                          child: FittedBox(
                            alignment: Alignment.center,
                            child: Icon(
                              icon,
                              size: cardHeight.h * 0.5,
                            ),
                          ),
                        ),
                        SizedBox(width: paddingBetweenHorizontal.w),
                        Flexible(
                          flex: 1,
                          child: Container(
                            // color: Colors.yellow,
                            height: fontSizePrimary.h * 2,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              buttonText,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style:
                                  context.theme.textTheme.bodyLarge!.copyWith(
                                color:
                                    context.theme.colorPalette.cardTextPrimary,
                                fontSize: fontSizePrimary.h,
                                height: 1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: paddingBetweenHorizontal.w),
                Container(
                  // color: Colors.blue.withOpacity(0.5),
                  alignment: Alignment.center,
                  height: cardHeight.h * 0.33,
                  width: cardHeight.h * 0.33,
                  child: FittedBox(
                    alignment: Alignment.center,
                    child: Icon(
                      CupertinoIcons.forward,
                      size: cardHeight.h * 0.33,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
