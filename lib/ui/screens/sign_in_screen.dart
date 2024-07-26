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

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                  text: AppStrings.signInScreenTitle,
                  textStyle: context.textTheme.headlineMedium!,
                  color: context.colorPalette.permaWhiteColor,
                  maxLines: 2,
                  fontLetterSpacingCustom: -1,
                ),
                SizedBox(height: 120.h),
                TextformfieldMain(
                  text: AppStrings.signInScreenTextFieldEmail,
                  textColor: context.colorPalette.permaWhiteColor,
                  lineColor: context.colorPalette.permaWhiteColor,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 74.h),
                TextformfieldMain(
                  text: AppStrings.signInScreenTextFieldPassword,
                  textColor: context.colorPalette.permaWhiteColor,
                  lineColor: context.colorPalette.permaWhiteColor,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                SizedBox(height: 74.h),
                SwitchCheckboxMain(
                  text: TextCustom(
                    text: AppStrings.signInScreenCheckboxRememberMe,
                    textStyle: context.textTheme.labelSmall!,
                    color: context.colorPalette.permaWhiteColor,
                  ),
                ),
                SizedBox(height: 100.h),
                ButtonMain(
                  onPressed: () {},
                  paddingHorizontal: 0,
                  text: AppStrings.signIn,
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
                SizedBox(height: 595.h),
                ButtonAlreadyHaveAccount(
                  onPressed: () {},
                  buttonText: AppStrings.signUp,
                  textStatic: AppStrings.dontHaveAnAccount,
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
