import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

/// TODO: Test this Circular Button
class ButtonCircularMain extends StatelessWidget {
  final Function() onPressed;
  final IconData? icon;
  final Widget? alternativeWidgetContent;
  final double? buttonSize;
  final double? iconSize;
  final Color? buttonColor;
  final Color? iconColor;
  final double? elevation;
  final Color? elevationColor;
  final bool? isNotificationOn;
  final bool? useShadow;

  const ButtonCircularMain({
    required this.onPressed,
    this.icon,
    this.alternativeWidgetContent,
    this.buttonSize = 65,
    this.iconSize = 25,
    this.buttonColor = Colors.white,
    this.iconColor = Colors.black,
    this.elevation = 0.2,
    this.elevationColor,
    this.isNotificationOn = false,
    super.key,
    this.useShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(Constants.kRadiusButtonMain.r),
      onTap: () {
        onPressed();
      },
      child: Stack(
        children: [
          Container(
            height: buttonSize!.h,
            width: buttonSize!.h,
            decoration: BoxDecoration(
              boxShadow: [
                if (useShadow == true)
                  BoxShadow(
                    color: elevationColor ??
                        context.colorPalette.text.withOpacity(0.35),
                    spreadRadius: elevation!,
                    blurRadius: 10,
                    offset: const Offset(0, 3.5),
                  ),
              ],
              shape: BoxShape.circle,
              color: buttonColor,
            ),
            child: Center(
              child: (icon is IconData)
                  ? Icon(
                      icon,
                      color: iconColor,
                      size: iconSize!.h,
                    )
                  : alternativeWidgetContent,
            ),
          ),
          if (isNotificationOn!)
            Positioned.fill(
              child: Align(
                alignment: const Alignment(0.7, -0.5),
                child: Container(
                  height: 7.5,
                  width: 7.5,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
