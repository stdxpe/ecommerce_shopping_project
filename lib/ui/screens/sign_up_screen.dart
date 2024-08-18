import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/firebase/firebase_user_provider.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/sign_up_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_already_have_account.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/icons/google_logo.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/background_blur_filter.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_checkbox_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/ui/widgets/textformfield_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const BackgroundBlurFilter(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    Constants.kSignRelatedScreensMainPaddingHorizontal.w),
            child: ListView(
              clipBehavior: Clip.none,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                SizedBox(height: 363.h),
                TextCustom(
                  text: AppStrings.signUpScreenTitle,
                  textStyle: context.textTheme.headlineMedium!,
                  color: context.colorPalette.permaWhiteColor,
                  maxLines: 2,
                  fontLetterSpacingCustom: -1,
                ),
                SizedBox(height: 120.h),
                TextformfieldMain(
                  onChanged: (value) =>
                      ref.watch(signUpProvider.notifier).updateEmail(value),
                  validator: (value) => ref.watch(signUpProvider).email.error,
                  hintText: AppStrings.signUpScreenTextFieldEmail,
                  textColor: context.colorPalette.permaWhiteColor,
                  lineColor: context.colorPalette.permaWhiteColor,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 65.h),
                TextformfieldMain(
                  onChanged: (value) =>
                      ref.watch(signUpProvider.notifier).updatePassword(value),
                  validator: (value) =>
                      ref.watch(signUpProvider).password.error,
                  obscureText: true,
                  hintText: AppStrings.signUpScreenTextFieldPassword,
                  textColor: context.colorPalette.permaWhiteColor,
                  lineColor: context.colorPalette.permaWhiteColor,
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 65.h),
                TextformfieldMain(
                  onChanged: (value) => ref
                      .watch(signUpProvider.notifier)
                      .updateConfirmPassword(value),
                  validator: (value) =>
                      ref.watch(signUpProvider).confirmPassword.error,
                  obscureText: true,
                  hintText: AppStrings.signUpScreenTextFieldConfirmPassword,
                  textColor: context.colorPalette.permaWhiteColor,
                  lineColor: context.colorPalette.permaWhiteColor,
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 75.h),
                SwitchCheckboxMain(
                  isChecked: ref.watch(checkboxSignUpProvider),
                  onChanged: () => ref
                      .read(checkboxSignUpProvider.notifier)
                      .state = !ref.read(checkboxSignUpProvider.notifier).state,
                  checkedColor: ColorPalette.permaBlackColor,
                  uncheckedColor: ColorPalette.sheetBackground,
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
                  onPressed: () async {
                    ref.watch(signUpProvider.notifier).getStatus();
                    print('status: ${ref.watch(signUpProvider).status}');

                    if (ref.watch(signUpProvider).status!) {
                      /// TODO: Firebase methods here
                      await ref
                          .read(userProvider.notifier)
                          .createUserWithEmailAndPassword(
                            email: ref.read(signUpProvider).email.text!,
                            password: ref.read(signUpProvider).password.text!,
                            context: context,
                          );
                    }
                  },
                  paddingHorizontal: 0,
                  text: AppStrings.signUp,
                ),
                SizedBox(height: Constants.kButtonSpacingBTWButtonsVertical.h),
                ButtonMain(
                  onPressed: () async => await ref
                      .read(userProvider.notifier)
                      .signInWithGoogle(context),
                  paddingHorizontal: 0,
                  text: AppStrings.continueWithGoogle,
                  icon: GoogleLogo(size: 38.h),
                  backgroundColor:
                      context.colorPalette.buttonMainBackgroundSecondary,
                  foregroundColor:
                      context.colorPalette.buttonMainForegroundSecondary,
                ),
                SizedBox(height: 470.h),
                ButtonAlreadyHaveAccount(
                  onPressed: () => context.pushReplacement(Routes.signIn),
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
