import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_already_have_account.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_verification_textfield.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

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
              text: AppStrings.verificationScreenTitle,
              textStyle: context.textTheme.headlineMedium!,
              color: context.colorPalette.title,
              fontLetterSpacingCustom: -1,
            ),
            SizedBox(height: 100.h),
            TextCustom(
              text: AppStrings.verificationScreenSubtitle,
              textStyle: context.textTheme.headlineSmall!,
              color: context.colorPalette.title,
              fontSizeCustom: 40,
              fontWeightCustom: FontWeight.w600,
              maxLines: 2,
            ),
            SizedBox(height: 175.h),
            const SwitchVerificationTextField(),
            SizedBox(height: 60.h),
            ButtonAlreadyHaveAccount(
              onPressed: () {},
              buttonText: AppStrings.verificationScreenButton,
            ),
            SizedBox(height: 200.h),
          ],
        ),
      ),
    );
  }
}
