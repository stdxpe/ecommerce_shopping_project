import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Container(
      color: Colors.red.withOpacity(0.5),
      padding: EdgeInsets.only(
        top: paddingTop ?? 77.h,
        bottom: paddingBottom ?? 60.h,
        left: paddingHorizontal ?? 15.w,
        right: paddingHorizontal ?? 15.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            flex: 5,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.theme.textTheme.titleLarge!.copyWith(
                color: context.theme.colorPalette.title,
                letterSpacing: -0.5,
                height: 0.8,
              ),
            ),
          ),
          Flexible(flex: 1, child: SizedBox(width: 10.w)),
          Flexible(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                onPressed();
              },
              child: Text(
                buttonText,
                maxLines: 1,
                style: context.theme.textTheme.titleMedium!.copyWith(
                  color: context.theme.colorPalette.textButtonFaded,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                  height: 0.8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
