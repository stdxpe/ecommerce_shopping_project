import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/textformfield_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: 1.sh,
        width: 1.sw,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          // color: Colors.green.withOpacity(0.5),
          color: Color(0xFF574A18),
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 463.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 90.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  // height: 138.h,
                  // width: 582.w,
                  child: FittedBox(
                    child: Text(
                      AppStrings.signInScreenTitle,
                      textAlign: TextAlign.left,
                      style: context.theme.textTheme.bodyMedium!.copyWith(
                        // color: context.theme.colorPalette.text,
                        color: Colors.white,
                        fontSize: 86.sp,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                        height: 1.3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(height: 211.h),
            SizedBox(height: 120.h),

            TextformfieldMain(
              text: AppStrings.signInScreenTextFieldEmail,
              paddingHorizontal: Constants.kButtonPaddingHorizontal.w,
            ),
            SizedBox(height: 74.h),
            TextformfieldMain(
              text: AppStrings.signInScreenTextFieldPassword,
              paddingHorizontal: Constants.kButtonPaddingHorizontal.w,
            ),

            /// end
            SizedBox(height: 72.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 90.w),
              child: Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  SizedBox(width: 35.w),
                  Text(
                    AppStrings.signInScreenTextFieldRememberMe,
                    textAlign: TextAlign.left,
                    style: context.theme.textTheme.bodyMedium!.copyWith(
                      // color: context.theme.colorPalette.text,
                      color: Colors.white,
                      fontSize: 47.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 87.h),
            ButtonMain(
              onPressed: () {},
              text: AppStrings.signUpWithEmail,
              icon: Icon(
                CupertinoIcons.mail,
                size: 40.h,
              ),
            ),
            SizedBox(height: 60.h),
            ButtonMain(
              onPressed: () {},
              text: AppStrings.continueWithGoogle,
              icon: Icon(
                Icons.mail,
                size: 40.h,
              ),
              backgroundColor:
                  context.theme.colorPalette.buttonMainBackgroundSecondary,
              foregroundColor:
                  context.theme.colorPalette.buttonMainForegroundSecondary,
            ),

            SizedBox(height: 595.h),
            Text(
              AppStrings.dontHaveAnAccount,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.headlineSmall!.copyWith(
                color: context.theme.colorPalette.title,
                fontSize: 39.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
                height: 1,
              ),
            ),
            SizedBox(height: 210.h),
          ],
        ),
      ),
    );
  }
}
