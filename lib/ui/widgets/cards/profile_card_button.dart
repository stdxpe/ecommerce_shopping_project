import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProfileCardButton extends StatelessWidget {
  const ProfileCardButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.icon,
    this.widgetContent,
    this.useForwardIcon = true,
    this.useBottomDivider = false,
    this.cardHeight = 150,
    this.paddingCardHorizontal = Constants.kMainPaddingHorizontal,
  });

  final Function() onPressed;
  final String buttonText;
  final IconData? icon;
  final Widget? widgetContent;
  final bool? useForwardIcon;
  final bool? useBottomDivider;
  final double? cardHeight;
  final double? paddingCardHorizontal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 0.5,
            endIndent: 0,
            indent: 0,
            height: 0,
            color: context.colorPalette.text.withOpacity(0.26),
          ),
          Container(
            color: context.colorPalette.sheetBackground,
            height: cardHeight!.h,
            width: 1.sw,
            padding: EdgeInsets.symmetric(
                horizontal: Constants.kProfileButtonPaddingHorizontal.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: cardHeight!.h * 0.4,
                  width: cardHeight!.h * 0.4,
                  child: FittedBox(
                    alignment: Alignment.center,
                    child: Icon(
                      icon,
                      size: cardHeight!.h * 0.4,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            Constants.kProfileButtonTextsPaddingHorizontal.w),
                    // color: Colors.yellow,
                    // height: fontSizePrimary.h * 2,
                    alignment: Alignment.centerLeft,
                    child: TextCustom(
                      text: buttonText,
                      textStyle: context.textTheme.bodyMedium!,
                      color: context.colorPalette.cardTextPrimary,
                      fontWeightCustom: FontWeight.w600,
                      fontSizeCustom: 38,
                    ),
                  ),
                ),
                (widgetContent == null)
                    ? Container(
                        alignment: Alignment.center,
                        height: cardHeight!.h * 0.33,
                        width: cardHeight!.h * 0.33,
                        child: FittedBox(
                          alignment: Alignment.center,
                          child: Icon(
                            CupertinoIcons.forward,
                            size: cardHeight!.h * 0.33,
                            color: context.colorPalette.text.withOpacity(0.5),
                          ),
                        ),
                      )
                    : widgetContent!,
              ],
            ),
          ),
          if (useBottomDivider!)
            Divider(
              thickness: 0.5,
              endIndent: 0,
              indent: 0,
              height: 0,
              color: context.colorPalette.text.withOpacity(0.26),
            ),
        ],
      ),
    );
  }
}
