import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class TitleCreditCardSection extends StatelessWidget {
  const TitleCreditCardSection({
    super.key,
    required this.onPressed,
    required this.cardHolder,
    required this.cardNumber,
    required this.validThru,
    this.useTopDivider = false,
  });

  final Function onPressed;
  final String cardHolder;
  final String cardNumber;
  final String validThru;
  final bool? useTopDivider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Constants.kMainPaddingHorizontal.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (useTopDivider!)
              Divider(
                thickness: 0.75,
                height: 0,
                color: context.colorPalette.text.withOpacity(0.25),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h),
                  TextCustom(
                    text: cardNumber,
                    textStyle: context.textTheme.bodyLarge!,
                    color: context.colorPalette.cardTextPrimary,
                    fontSizeCustom: 42,
                  ),
                  SizedBox(height: 25.h),
                  TextCustom(
                    /// TODO: Obscure number
                    text: cardHolder,
                    textStyle: context.textTheme.bodySmall!,
                    color: context.colorPalette.cardTextSecondary,
                    fontHeightCustom: 1.3,
                    fontWeightCustom: FontWeight.w400,
                    isHeightConstraintRelated: false,
                  ),
                  TextCustom(
                    text: validThru,
                    textStyle: context.textTheme.bodySmall!,
                    color: context.colorPalette.cardTextSecondary,
                    fontHeightCustom: 1.3,
                    fontWeightCustom: FontWeight.w400,
                    isHeightConstraintRelated: false,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextCustom(
                      text: AppStrings.creditCardsScreenSectionEditButton,
                      textStyle: context.textTheme.bodyMedium!,
                      color: ColorPalette.textButtonGreen,
                      fontWeightCustom: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
            Divider(
              thickness: 0.75,
              height: 0,
              color: context.colorPalette.text.withOpacity(0.25),
            ),
          ],
        ),
      ),
    );
  }
}
