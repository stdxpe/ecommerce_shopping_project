import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_already_have_account.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/sliders/onboarding_slider.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

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
            child: SizedBox(
              width: 532.w,
              child: FittedBox(
                child: Text(
                  AppStrings.onboardingScreenTitle,
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.headlineSmall!.copyWith(
                    color: context.theme.colorPalette.title,
                    height: 0.8,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 92.h),
          Align(
            child: SizedBox(
              // width: 775.w,
              child: FittedBox(
                child: Text(
                  AppStrings.onboardingScreenSubtitle,
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.headlineSmall!.copyWith(
                    color: context.theme.colorPalette.title,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const OnboardingSlider(),
          SizedBox(height: 142.h),
          ButtonMain(
            onPressed: () {},
            text: AppStrings.continueButton,
          ),
          SizedBox(height: 107.h),
          Align(
            child: ButtonAlreadyHaveAccount(
              onPressed: () {},
              textStatic: AppStrings.alreadyHaveAnAccount,
              buttonText: AppStrings.signIn,
              textStaticColor:
                  context.theme.colorPalette.title.withOpacity(0.75),
              buttonTextColor: context.theme.colorPalette.title,
              fontSize: 40.sp,
            ),
          ),
          SizedBox(height: 232.h),
        ],
      ),
    );
  }
}
