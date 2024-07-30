import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class TitlePaymentSummarySection extends StatelessWidget {
  const TitlePaymentSummarySection({
    super.key,
    required this.onPressed,
    required this.title,
    required this.subtext,
    this.textButtonText,
    this.useTopDivider = false,
  });

  final Function onPressed;
  final String title;
  final String subtext;
  final String? textButtonText;
  final bool? useTopDivider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (useTopDivider!)
            Divider(
              thickness: 0.75,
              height: 0,
              // color: Colors.black26,
              color: context.colorPalette.text.withOpacity(0.25),
            ),
          if (useTopDivider!) SizedBox(height: 50.h),
          TextCustom(
            text: title,
            textStyle: context.textTheme.bodyLarge!,
            color: context.colorPalette.cardTextPrimary,
            fontSizeCustom: 44,
          ),
          SizedBox(height: 15.h),
          TextCustom(
            text: subtext,
            textStyle: context.textTheme.bodySmall!,
            color: context.colorPalette.cardTextSecondary,
            maxLines: 3,
            fontHeightCustom: 1.3,
            fontWeightCustom: FontWeight.w400,
            isHeightConstraintRelated: false,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextCustom(
              text: textButtonText ??
                  AppStrings.paymentScreenSummarySheetSectionButtonChange,
              textStyle: context.textTheme.bodyMedium!,
              color: ColorPalette.textButtonGreen,
              fontWeightCustom: FontWeight.w600,
            ),
          ),
          SizedBox(height: 50.h),
          Divider(
            thickness: 0.75,
            height: 0,
            color: context.colorPalette.text.withOpacity(0.25),
          ),
        ],
      ),
    );
  }
}
