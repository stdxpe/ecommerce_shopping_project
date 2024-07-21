import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/icons/google_logo.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AppImages.productImage12,
            ),
          ),
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 1035.h),
            Align(
              alignment: Alignment.center,
              child: TextCustom(
                text: AppStrings.appTitle,
                textStyle: context.textTheme.headlineLarge!,
                color: context.colorPalette.title,
                boxShadowsCustom: [
                  BoxShadows.kBoxShadowTitle(
                    color: context.theme.colorPalette.permaBlackColor
                        .withOpacity(0.54),
                  ),
                ],
                foregroundPaintCustom: Paint()
                  ..shader = LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      context.theme.colorPalette.permaWhiteColor,
                      context.theme.colorPalette.permaWhiteColor
                          .withOpacity(0.8),
                    ],
                  ).createShader(Rect.fromLTWH(0.0, 0.0, 0.0, 150.0.h)),
              ),
            ),
            SizedBox(height: 60.h),
            Align(
              alignment: Alignment.center,
              child: TextCustom(
                text: AppStrings.appSubtitle,
                textStyle: context.textTheme.headlineSmall!,
                color: context.colorPalette.permaWhiteColor,
                fontSizeCustom: 40,
                fontWeightCustom: FontWeight.w700,
                fontLetterSpacingCustom: 0.5,
                boxShadowsCustom: [
                  BoxShadows.kBoxShadowText(
                    color: context.theme.colorPalette.permaBlackColor
                        .withOpacity(0.54),
                  ),
                ],
              ),
            ),
            SizedBox(height: 734.h),
            ButtonMain(
              onPressed: () {},
              text: AppStrings.signUpWithEmail,
              icon: Icon(Icons.mail, size: 48.h),
              backgroundColor:
                  context.colorPalette.buttonMainBackgroundSecondary,
              foregroundColor:
                  context.colorPalette.buttonMainForegroundSecondary,
            ),
            SizedBox(height: 60.h),
            ButtonMain(
              onPressed: () {},
              text: AppStrings.continueWithGoogle,
              icon: GoogleLogo(size: 38.h),
            ),
            SizedBox(height: 200.h),
          ],
        ),
      ),
    );
  }
}
