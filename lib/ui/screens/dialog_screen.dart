import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class DialogScreen<T> extends Page<T> {
  final Widget dialogPopup;
  final bool barrierDismissible;

  const DialogScreen({
    required this.dialogPopup,
    this.barrierDismissible = true,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) => DialogRoute<T>(
        context: context,
        settings: this,
        barrierDismissible: barrierDismissible,
        useSafeArea: false,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7.5, sigmaY: 7.5),
            child: AlertDialog(
              backgroundColor: context.colorPalette.scaffoldBackground,
              surfaceTintColor: context.colorPalette.scaffoldBackground,
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              clipBehavior: Clip.hardEdge,
              elevation: 2.5,
              shadowColor: Colors.white.withOpacity(0.05),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(Constants.kRadiusDialogPopups.r),
              ),
              title: dialogPopup,
            ),
          ).animate().fadeIn(duration: 250.ms);
        },
      );
}
