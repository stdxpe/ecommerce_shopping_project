import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/ui/widgets/textformfield_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Constants.kSignRelatedScreensMainPaddingHorizontal.w),
        child: ListView(
          clipBehavior: Clip.none,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 463.h),
            TextCustom(
              text: AppStrings.forgotPasswordScreenTitle,
              textStyle: context.textTheme.headlineMedium!,
              color: context.colorPalette.title,
              fontLetterSpacingCustom: -1,
            ),
            SizedBox(height: 100.h),
            TextCustom(
              text: AppStrings.forgotPasswordScreenSubtitle,
              textStyle: context.textTheme.headlineSmall!,
              color: context.colorPalette.title,
              fontSizeCustom: 40,
              fontWeightCustom: FontWeight.w600,
              maxLines: 2,
            ),
            SizedBox(height: 100.h),
            const TextformfieldMain(
              autoFocus: true,
              hintText: AppStrings.forgotPasswordScreenTextField,
              textInputType: TextInputType.number,
            ),
            SizedBox(height: 125.h),
            ButtonMain(
              onPressed: () {},
              paddingHorizontal: 0,
              text: AppStrings.forgotPasswordScreenButton,
            ),
            SizedBox(height: 200.h),
          ],
        ),
      ),
    );
  }
}
