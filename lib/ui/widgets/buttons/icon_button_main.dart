import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class IconButtonMain extends StatelessWidget {
  const IconButtonMain({
    required this.onPressed,
    this.icon,
    this.alternativeWidgetContent,
    this.height,
    this.iconHeight,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderWidth,
    this.useShadow = true,
    super.key,
  });

  final Function onPressed;
  final IconData? icon;
  final Widget? alternativeWidgetContent;
  final double? height;
  final double? iconHeight;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final bool? useShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?.h ?? 150.h,
      width: height?.h ?? 150.h,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
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
      child: Center(
        child: IconButton(
          onPressed: () {
            onPressed();
          },
          style: IconButton.styleFrom(
            /// Uncomment for Click Effect Color
            /// overlayColor: Colors.blue,
            alignment: Alignment.center,
            elevation: 0,
            side: BorderSide(
              color: (borderWidth != null && borderWidth != 0)
                  ? borderColor ?? Colors.black87
                  : Colors.transparent,
              width: borderWidth ?? 0,
            ),
            foregroundColor: foregroundColor ??
                context.colorPalette.buttonMainForegroundSecondary,
            backgroundColor: backgroundColor ??
                context.colorPalette.buttonMainBackgroundSecondary,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(Constants.kRadiusButtonMain.r),
            ),
          ),
          icon: AspectRatio(
            aspectRatio: 1,
            child: alternativeWidgetContent ??
                Icon(
                  icon ?? Icons.favorite_border,
                  size: iconHeight?.h ?? height!.h * 0.5,
                ),
          ),
        ),
      ),
    );
  }
}
