import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class TitleWithTextButton extends StatelessWidget {
  const TitleWithTextButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.buttonText,
    this.paddingHorizontal,
    this.paddingTop,
    this.paddingBottom,
  });

  final Function onPressed;
  final String title;
  final String buttonText;
  final double? paddingHorizontal;
  final double? paddingTop;
  final double? paddingBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop ?? Constants.kMainTitlePaddingTopForHomeScreen.h,
        bottom: paddingBottom ?? Constants.kMainTitlePaddingBottom.h,
        left: paddingHorizontal ?? Constants.kMainPaddingHorizontal.w,
        right: paddingHorizontal ?? Constants.kMainPaddingHorizontal.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            flex: 9,
            child: TextCustom(
              text: title,
              textStyle: context.textTheme.titleLarge!,
              color: context.colorPalette.title,
            ),
          ),
          Flexible(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                onPressed();
              },
              child: TextCustom(
                text: buttonText,
                textStyle: context.textTheme.titleMedium!,
                color: context.colorPalette.textButtonFaded,
                textAlignCustom: TextAlign.end,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
