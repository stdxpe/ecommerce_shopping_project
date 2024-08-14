import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/firebase/firebase_providers.dart';
import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/sign_in_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_already_have_account.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/icons/google_logo.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/background_blur_filter.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/ui/widgets/textformfield_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

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
                  text: AppStrings.signInScreenTitle,
                  textStyle: context.textTheme.headlineMedium!,
                  color: context.colorPalette.permaWhiteColor,
                  maxLines: 2,
                  fontLetterSpacingCustom: -1,
                ),
                SizedBox(height: 120.h),
                TextformfieldMain(
                  onChanged: (value) =>
                      ref.watch(signInProvider.notifier).updateEmail(value),
                  validator: (value) => ref.watch(signInProvider).email.error,
                  hintText: AppStrings.signInScreenTextFieldEmail,
                  textColor: context.colorPalette.permaWhiteColor,
                  lineColor: context.colorPalette.permaWhiteColor,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  // autoFocus: true,
                ),
                SizedBox(height: 74.h),
                TextformfieldMain(
                  onChanged: (value) =>
                      ref.watch(signInProvider.notifier).updatePassword(value),
                  validator: (value) =>
                      ref.watch(signInProvider).password.error,
                  obscureText: true,
                  hintText: AppStrings.signInScreenTextFieldPassword,
                  textColor: context.colorPalette.permaWhiteColor,
                  lineColor: context.colorPalette.permaWhiteColor,
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 74.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: ButtonAlreadyHaveAccount(
                    fontSize: 32,
                    onPressed: () => context.push(Routes.forgotPassword),
                    buttonText: AppStrings.forgotYourPassword,
                    textStaticColor: context.colorPalette.permaWhiteColor,
                    buttonTextColor: context.colorPalette.permaWhiteColor,
                  ),
                ),
                // SwitchCheckboxMain(
                //   isChecked: ref.watch(checkboxSignInProvider),
                //   onChanged: () => ref
                //       .read(checkboxSignInProvider.notifier)
                //       .state = !ref.read(checkboxSignInProvider.notifier).state,
                //   checkedColor: ColorPalette.permaBlackColor,
                //   uncheckedColor: ColorPalette.sheetBackground,
                //   text: TextCustom(
                //     text: AppStrings.signInScreenCheckboxRememberMe,
                //     textStyle: context.textTheme.labelSmall!,
                //     color: context.colorPalette.permaWhiteColor,
                //   ),
                // ),
                SizedBox(height: 100.h),
                ButtonMain(
                  onPressed: () async {
                    ref.watch(signInProvider.notifier).getStatus();
                    print('status: ${ref.watch(signInProvider).status}');

                    if (ref.watch(signInProvider).status!) {
                      /// TODO: Firebase Methods Here

                      try {
                        await ref
                            .read(firebaseAuthProvider)
                            .signInWithEmailAndPassword(
                              email: ref.read(signInProvider).email.text!,
                              password: ref.read(signInProvider).password.text!,
                            );

                        if (ref.read(firebaseAuthProvider).currentUser != null)
                          context.push(Routes.home);
                      } catch (e) {
                        print(e);
                      }
                      context.push(Routes.home);
                    }
                  },
                  paddingHorizontal: 0,
                  text: AppStrings.logIn,
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
                SizedBox(height: 695.h),
                ButtonAlreadyHaveAccount(
                  onPressed: () => context.pushReplacement(Routes.signUp),
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
