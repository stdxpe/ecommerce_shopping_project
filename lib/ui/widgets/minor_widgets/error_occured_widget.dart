import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ErrorOccuredWidget extends StatelessWidget {
  const ErrorOccuredWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: context.mediaQuery.size.height * 0.27),
        Icon(
          Icons.error_rounded,
          size: 150.h,
          color: context.colorPalette.text.withOpacity(0.7),
        ),
        SizedBox(height: 40.h),
        TextCustom(
          text: AppStrings.globalStateErrorMessage,
          color: context.colorPalette.text.withOpacity(0.6),
          textStyle: context.textTheme.bodyMedium!,
          maxLines: 2,
          fontHeightCustom: 1.3,
          fontSizeCustom: 36,
          fontWeightCustom: FontWeight.w600,
          textAlignCustom: TextAlign.center,
        ),
      ],
    ).animate().fadeIn(
          duration: 600.ms,
        );
  }
}
