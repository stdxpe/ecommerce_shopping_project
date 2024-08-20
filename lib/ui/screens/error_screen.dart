import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.mediaQuery.size.height,
        width: context.mediaQuery.size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextCustom(
              text: AppStrings.error404Title,
              color: context.colorPalette.text.withOpacity(0.6),
              textStyle: context.textTheme.bodyMedium!,
              fontSizeCustom: 200,
              fontWeightCustom: FontWeight.w700,
              textAlignCustom: TextAlign.center,
            ).animate().fadeIn(duration: 300.ms),
            SizedBox(height: 40.h),
            TextCustom(
              text: AppStrings.error404Subtitle,
              color: context.colorPalette.text.withOpacity(0.6),
              textStyle: context.textTheme.bodyMedium!,
              fontSizeCustom: 50,
              fontWeightCustom: FontWeight.w500,
              textAlignCustom: TextAlign.center,
            ).animate().fadeIn(delay: 200.ms, duration: 300.ms),
          ],
        ),
      ),
    );
  }
}
