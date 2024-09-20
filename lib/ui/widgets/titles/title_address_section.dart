import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class TitleAddressSection extends StatelessWidget {
  const TitleAddressSection({
    super.key,
    required this.onPressed,
    required this.title,
    required this.addressText,
    required this.zipCode,
    required this.city,
    required this.country,
    this.useTopDivider = false,
  });

  final Function onPressed;
  final String title;
  final String addressText;
  final String zipCode;
  final String city;
  final String country;
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
                    text: title,
                    textStyle: context.textTheme.bodyLarge!,
                    color: context.colorPalette.cardTextPrimary,
                    fontSizeCustom: 42,
                  ),
                  SizedBox(height: 25.h),
                  TextCustom(
                    text: addressText,
                    textStyle: context.textTheme.bodySmall!,
                    color: context.colorPalette.cardTextSecondary,
                    maxLines: 4,
                    fontHeightCustom: 1.3,
                    fontWeightCustom: FontWeight.w400,
                    isHeightConstraintRelated: false,
                  ),
                  TextCustom(
                    text: '$city, $zipCode\n$country',
                    textStyle: context.textTheme.bodySmall!,
                    color: context.colorPalette.cardTextSecondary,
                    maxLines: 2,
                    fontHeightCustom: 1.3,
                    fontWeightCustom: FontWeight.w400,
                    isHeightConstraintRelated: false,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextCustom(
                      text: AppStrings.addressesScreenSectionEditButton,
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
