import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
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
              TextCustom(
                text: 'SPRING COLLECTION',
                textStyle: context.textTheme.bodyMedium!,
                color: context.colorPalette.permaWhiteColor,
                fontSizeCustom: 42,
                fontWeightCustom: FontWeight.w600,
                textAlignCustom: TextAlign.center,
                boxShadowsCustom: [
                  BoxShadows.kBoxShadowText(
                    color:
                        context.colorPalette.permaBlackColor.withOpacity(0.54),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                height: 20,
                endIndent: 590.w,
                color: context.colorPalette.permaWhiteColor,
              ),
              const SizedBox(height: 10),
              TextCustom(
                text: '20% OFF',
                textStyle: context.textTheme.displayLarge!,
                color: context.colorPalette.permaWhiteColor,
                fontSizeCustom: 150,
                fontWeightCustom: FontWeight.w800,
                fontLetterSpacingCustom: -1,
                textAlignCustom: TextAlign.center,
                boxShadowsCustom: [
                  BoxShadows.kBoxShadowText(
                    color:
                        context.colorPalette.permaBlackColor.withOpacity(0.54),
                  ),
                ],
              ),
              TextCustom(
                text: 'For Selected Spring Style',
                textStyle: context.textTheme.displayLarge!,
                color: context.colorPalette.permaWhiteColor,
                fontSizeCustom: 40,
                fontWeightCustom: FontWeight.w600,
                fontLetterSpacingCustom: 0,
                textAlignCustom: TextAlign.center,
                boxShadowsCustom: [
                  BoxShadows.kBoxShadowText(
                    color:
                        context.colorPalette.permaBlackColor.withOpacity(0.54),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
