import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/forgot_password_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/ui/widgets/textformfield_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});

  /// TODO: Forgot Password email or sms link?
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            TextformfieldMain(
              onChanged: (value) =>
                  ref.watch(forgotPasswordProvider.notifier).updatePhone(value),
              validator: (value) =>
                  ref.watch(forgotPasswordProvider).phone.error,
              autoFocus: true,
              hintText: AppStrings.forgotPasswordScreenTextField,
              textInputType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SizedBox(height: 125.h),
            ButtonMain(
              onPressed: () {
                ref.watch(forgotPasswordProvider.notifier).getStatus();
                print('status: ${ref.watch(forgotPasswordProvider).status}');

                if (ref.watch(forgotPasswordProvider).status!) {
                  /// TODO: Firebase methods here
                  context.push(Routes.verification);
                }
              },
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
