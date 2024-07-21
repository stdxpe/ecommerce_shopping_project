import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_already_have_account.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/sliders/onboarding_slider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key, this.onPressed});
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 289.h),
          Align(
            alignment: Alignment.center,
            child: TextCustom(
              text: AppStrings.onboardingScreenTitle,
              textStyle: context.textTheme.headlineSmall!,
              color: context.colorPalette.title,
            ),
          ),
          SizedBox(height: 92.h),
          Align(
            alignment: Alignment.center,
            child: TextCustom(
              text: AppStrings.onboardingScreenSubtitle,
              textStyle: context.textTheme.headlineSmall!,
              color: context.colorPalette.title,
              fontSizeCustom: 40,
              fontWeightCustom: FontWeight.w600,
              maxLines: 2,
              textAlignCustom: TextAlign.center,
            ),
          ),
          const OnboardingSlider(),
          SizedBox(height: 142.h),
          ButtonMain(
            onPressed: () {
              if (onPressed != null) onPressed!();
            },
            text: AppStrings.continueButton,
          ),
          SizedBox(height: 107.h),
          ButtonAlreadyHaveAccount(
            onPressed: () {
              if (onPressed != null) onPressed!();
            },
            textStatic: AppStrings.alreadyHaveAnAccount,
            buttonText: AppStrings.signIn,
          ),
          SizedBox(height: 232.h),
        ],
      ),
    );
  }
}
