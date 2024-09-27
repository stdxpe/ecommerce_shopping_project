import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/order_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_buttons_payment_result.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class PaymentScreenResult extends ConsumerWidget {
  const PaymentScreenResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool result = ref.read(paymentStatus);

    return Scaffold(
      body: Container(
        height: context.mediaQuery.size.height,
        width: context.mediaQuery.size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topCenter,
                colors: [
                  Colors.transparent,
                  result
                      ? Colors.green.withOpacity(.3)
                      : Colors.redAccent.withOpacity(.9)
                  // Colors.blueGrey.withOpacity(.4),
                ])),
        child: SafeArea(
          bottom: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      result
                          ? AppImages.lottieSuccessCheck
                          : AppImages.lottieError,
                      repeat: false,
                      fit: BoxFit.contain,
                      height: context.mediaQuery.size.width * 0.55,
                      width: context.mediaQuery.size.width * 0.55,
                    ),
                    SizedBox(
                        height: Constants.kDialogPopupSpacingBTWTextVertical.h),
                    TextCustom(
                      text: result
                          ? AppStrings.paymentScreenTitleSuccessResultMessage
                          : AppStrings.paymentScreenTitleFailedResultMessage,
                      textStyle: context.textTheme.displaySmall!,
                      color: context.colorPalette.text,
                      fontSizeCustom: 100,
                      fontWeightCustom: FontWeight.w700,
                      fontHeightCustom: 1.0,
                      fontLetterSpacingCustom: -0.5,
                      textAlignCustom: TextAlign.center,
                    ).animate(delay: 1200.ms).fadeIn(duration: 600.ms),
                    SizedBox(
                        height: Constants.kDialogPopupSpacingBTWTextVertical.h *
                            0.75),
                    TextCustom(
                      text: result
                          ? AppStrings.paymentScreenSubtitleSuccessResultMessage
                          : AppStrings.paymentScreenSubtitleFailedResultMessage,
                      textStyle: context.textTheme.displaySmall!,
                      color: context.colorPalette.text.withOpacity(0.8),
                      maxLines: 3,
                      fontSizeCustom: 33,
                      fontWeightCustom: FontWeight.w500,
                      fontHeightCustom: 1.4,
                      fontLetterSpacingCustom: 0,
                      textAlignCustom: TextAlign.center,
                      isHeightConstraintRelated: false,
                    ).animate(delay: 1600.ms).fadeIn(duration: 500.ms),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomSheetButtonsPaymentResult(
                  useTransparentBg: true,
                  onPressed: () => context.go(Routes.home),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
