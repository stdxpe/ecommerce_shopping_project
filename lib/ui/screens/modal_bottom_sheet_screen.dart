import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ModalBottomSheetScreen<T> extends Page<T> {
  final Widget bottomSheet;
  final double? heightRatio;
  final bool barrierDismissible;

  const ModalBottomSheetScreen({
    required this.bottomSheet,
    this.heightRatio = 0.75,
    this.barrierDismissible = true,
    super.key,
  });

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute<T>(
        isDismissible: true,
        enableDrag: false,
        constraints: BoxConstraints(
          maxHeight: context.mediaQuery.size.height * heightRatio!,
          minHeight: context.mediaQuery.size.height * heightRatio!,
          maxWidth: context.mediaQuery.size.width,
          minWidth: context.mediaQuery.size.width,
        ),
        isScrollControlled: true,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              Constants.kRadiusBottomSheets.r,
            ),
          ),
        ),
        backgroundColor: context.colorPalette.sheetBackground,
        modalBarrierColor: Colors.black.withOpacity(0.75),
        sheetAnimationStyle: AnimationStyle(
          duration: 300.ms,
          reverseDuration: 300.ms,
        ),
        settings: this,
        builder: (context) => bottomSheet,
      );
}
