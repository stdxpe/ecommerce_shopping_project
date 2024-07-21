import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ButtonMain extends StatelessWidget {
  const ButtonMain({
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.height,
    this.paddingHorizontal,
    this.paddingVertical,
    this.paddingLeft,
    this.paddingRight,
    this.icon,
    this.fontSize,
    this.fontWeight,
    this.fontLetterSpacing,
    this.borderWidth,
    this.useShadow = true,
    super.key,
  });

  final Function onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? height;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final double? paddingLeft;
  final double? paddingRight;
  final Widget? icon;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? fontLetterSpacing;
  final double? borderWidth;
  final bool? useShadow;

  @override
  Widget build(BuildContext context) {
    double localPaddingHorizontal =
        paddingHorizontal ?? Constants.kButtonPaddingHorizontal.w;

    return Container(
      height: height ?? 150.h,
      margin: EdgeInsets.fromLTRB(
        paddingLeft ?? localPaddingHorizontal,
        paddingVertical ?? 0,
        paddingRight ?? localPaddingHorizontal,
        paddingVertical ?? 0,
      ),
      decoration: BoxDecoration(
        // color: context.colorPalette.buttonMainBackgroundPrimary,
        borderRadius: BorderRadius.all(
          Radius.circular(Constants.kRadiusButtonMain.r),
        ),
        boxShadow: [
          if (useShadow!)
            BoxShadows.kBoxShadowButton(
              color: context.colorPalette.shadowSecondary,
            ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          elevation: 1,
          side: BorderSide(
            color: (borderWidth != null && borderWidth != 0)
                ? borderColor ?? Colors.black87
                : Colors.transparent,
            width: borderWidth ?? 0,
          ),
          foregroundColor: foregroundColor ??
              context.colorPalette.buttonMainForegroundPrimary,
          backgroundColor: backgroundColor ??
              context.colorPalette.buttonMainBackgroundPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.kRadiusButtonMain.r),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (icon != null) icon!,
              if (icon != null) SizedBox(width: 30.h),
              Flexible(
                child: TextCustom(
                  text: text,
                  textStyle: context.textTheme.labelLarge!,
                  color: foregroundColor ??
                      context.colorPalette.buttonMainForegroundPrimary,
                  fontSizeCustom: fontSize,
                  fontWeightCustom: fontWeight,
                  fontLetterSpacingCustom: fontLetterSpacing,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
