import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class NoItemsFoundWidget extends StatelessWidget {
  const NoItemsFoundWidget({
    super.key,
    this.useText = true,
    this.fadeInDuration = 600,
  });

  final bool? useText;
  final int? fadeInDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: context.mediaQuery.size.height * 0.27),
        Icon(
          TablerIcons.shopping_bag_search,
          size: 150.h,
          color: context.colorPalette.text.withOpacity(0.6),
        ),
        SizedBox(height: 40.h),
        if (useText!)
          TextCustom(
            text: AppStrings.noItemsFound,
            color: context.colorPalette.text.withOpacity(0.5),
            textStyle: context.textTheme.bodyMedium!,
            fontSizeCustom: 36,
            fontWeightCustom: FontWeight.w600,
            textAlignCustom: TextAlign.center,
          ),
      ],
    ).animate().fadeIn(duration: fadeInDuration!.ms);
  }
}
