import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_already_have_account.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/icons/google_logo.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/background_blur_filter.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_checkbox_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/ui/widgets/textformfield_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const BackgroundBlurFilter(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Constants.kSignScreensMainPaddingHorizontal.w),
            child: ListView(
              clipBehavior: Clip.none,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                SizedBox(height: 463.h),
                TextCustom(
                  text: AppStrings.signUpScreenTitle,
                  textStyle: context.textTheme.headlineMedium!,
                  color: context.colorPalette.permaWhiteColor,
                  maxLines: 2,
                  fontLetterSpacingCustom: -1,
                ),
                SizedBox(height: 120.h),
                TextformfieldMain(
                  text: AppStrings.signUpScreenTextFieldEmail,
                  textColor: context.colorPalette.permaWhiteColor,
                  lineColor: context.colorPalette.permaWhiteColor,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 65.h),
                TextformfieldMain(
                  text: AppStrings.signUpScreenTextFieldPassword,
                  textColor: context.colorPalette.permaWhiteColor,
                  lineColor: context.colorPalette.permaWhiteColor,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                SizedBox(height: 65.h),
                TextformfieldMain(
                  text: AppStrings.signUpScreenTextFieldConfirmPassword,
                  textColor: context.colorPalette.permaWhiteColor,
                  lineColor: context.colorPalette.permaWhiteColor,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                SizedBox(height: 75.h),
                SwitchCheckboxMain(
                  text: TextCustom(
                    text: AppStrings.signUpScreenCheckboxPolicy,
                    textStyle: context.textTheme.labelSmall!,
                    maxLines: 2,
                    fontSizeCustom: 35,
                    fontHeightCustom: 1.2,
                    color: context.colorPalette.permaWhiteColor,
                  ),
                ),
                SizedBox(height: 100.h),
                ButtonMain(
                  onPressed: () {},
                  paddingHorizontal: 0,
                  text: AppStrings.signUp,
                ),
                SizedBox(height: Constants.kButtonSpacingBTWButtonsVertical.h),
                ButtonMain(
                  onPressed: () {},
                  paddingHorizontal: 0,
                  text: AppStrings.continueWithGoogle,
                  icon: GoogleLogo(size: 38.h),
                  backgroundColor:
                      context.colorPalette.buttonMainBackgroundSecondary,
                  foregroundColor:
                      context.colorPalette.buttonMainForegroundSecondary,
                ),
                SizedBox(height: 370.h),
                ButtonAlreadyHaveAccount(
                  onPressed: () {},
                  buttonText: AppStrings.logIn,
                  textStatic: AppStrings.alreadyHaveAnAccount,
                  textStaticColor: context.colorPalette.permaWhiteColor,
                  buttonTextColor: context.colorPalette.permaWhiteColor,
                ),
                SizedBox(height: 210.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
