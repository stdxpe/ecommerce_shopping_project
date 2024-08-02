import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/dialog_popups/dialog_popup_payment_result.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class DialogPopupMain extends StatelessWidget {
  final BuildContext context;
  final Widget content;
  final bool? barrierDismissible;

  const DialogPopupMain({
    required this.context,
    required this.content,
    this.barrierDismissible = true,
    super.key,
  });

  /// PROBLEMATIC.
  /// CODE SMELL
  Future<bool> showAlertDialog() async {
    return await showDialog(
          // useSafeArea: false,
          barrierColor: Colors.black.withOpacity(0.5),
          barrierDismissible: barrierDismissible!,
          context: context,
          builder: (context) => this,
        ) ??

        /// Returns false by default, if barrierDismissible set to true,
        /// Otherwise, any other click on the page, instead of buttons, returns NULL.
        false;
  }

  @override
  Widget build(BuildContext context) {
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
          borderRadius: BorderRadius.circular(Constants.kRadiusDialogPopups.r),
        ),
        title: DialogPopupPaymentResult(
          onPressed: () {},
          cardHeight: context.mediaQuery.size.height * 0.5,
          cardWidth: context.mediaQuery.size.width * 0.75,
        ),
      ),
    );
    // return BackdropFilter(
    //   filter: ImageFilter.blur(sigmaX: 7.5, sigmaY: 7.5),
    //   child: AlertDialog(
    //     insetPadding: EdgeInsets.zero,
    //     contentPadding: EdgeInsets.zero,
    //     clipBehavior: Clip.hardEdge,
    //     elevation: 2.5,
    //     shadowColor: Colors.white.withOpacity(0.05),
    //     surfaceTintColor: Colors.red,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(Constants.kRadiusDialogPopupCard),
    //     ),
    //     title: content,
    //     titlePadding: EdgeInsets.zero,
    //   ),
    // );
  }
}
