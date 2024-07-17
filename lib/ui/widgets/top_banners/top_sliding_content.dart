import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class DummyTopSlidingContent extends StatelessWidget {
  const DummyTopSlidingContent({
    super.key,
    required this.image,
    required this.logo,
  });
  final String image;
  final String logo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(right: 25.w, bottom: 0.w),
            child: Image(
              fit: BoxFit.contain,
              color: Colors.white,
              height: 250.w,
              width: 250.w,
              image: AssetImage(
                logo,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SPRING COLLECTION',
                textAlign: TextAlign.center,
                style: context.theme.textTheme.displayLarge!.copyWith(
                  color: context.theme.colorPalette.permaWhiteColor,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0,
                  shadows: [
                    BoxShadows.kBoxShadowText(
                      color: context.theme.colorPalette.permaBlackColor
                          .withOpacity(0.54),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                height: 20,
                endIndent: 200,
                color: context.theme.colorPalette.permaWhiteColor,
              ),
              const SizedBox(height: 10),
              Text(
                '20% OFF',
                textAlign: TextAlign.center,
                style: context.theme.textTheme.displayLarge!.copyWith(
                  color: context.theme.colorPalette.permaWhiteColor,
                  fontSize: 150.sp,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -2.w,
                  shadows: [
                    BoxShadows.kBoxShadowText(
                      color: context.theme.colorPalette.permaBlackColor
                          .withOpacity(0.54),
                    ),
                  ],
                ),
              ),
              Text(
                'For Selected Spring Style',
                textAlign: TextAlign.center,
                style: context.theme.textTheme.displayLarge!.copyWith(
                  color: context.theme.colorPalette.permaWhiteColor,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0,
                  shadows: [
                    BoxShadows.kBoxShadowText(
                      color: context.theme.colorPalette.permaBlackColor
                          .withOpacity(0.54),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
