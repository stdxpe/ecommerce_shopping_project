import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CustomNavBarItem extends StatelessWidget {
  const CustomNavBarItem({
    super.key,
    required this.onPressed,
    required this.currentIndex,
    required this.buttonIndex,
    required this.icon,
    this.useIconNotification = false,
  });

  final Function(int index) onPressed;
  final int currentIndex;
  final int buttonIndex;
  final IconData icon;
  final bool? useIconNotification;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onPressed(buttonIndex);
        },
        child: Container(
          padding: EdgeInsets.only(top: 50.h),
          alignment: Alignment.topCenter,
          color: Colors.transparent,
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    // color: Colors.green.withOpacity(0.5),
                    child: Icon(
                      icon,
                      size: 75.h,
                      color: currentIndex == buttonIndex
                          ? context.colorPalette.navigationBarActive
                          : context.colorPalette.navigationBarPassive,
                    ),
                  ),
                  if (useIconNotification!)
                    Positioned(
                      right: -15.w,
                      top: -13.h,
                      child: Container(
                        height: 46.h,
                        width: 46.h,
                        decoration: const BoxDecoration(
                          color: ColorPalette.iconNotifications,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: FittedBox(
                            child: TextCustom(
                              /// TODO: ref.watch(shoppingCartProvider).length,
                              text: '6',
                              textStyle: context.textTheme.bodySmall!,
                              fontSizeCustom: 28,
                              fontWeightCustom: FontWeight.w600,
                              color: Colors.white,
                              textAlignCustom: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 40.h),
              const Dot()
                  .animate(target: currentIndex == buttonIndex ? 1 : 0)
                  .slideY(
                      begin: 5.5,
                      end: 0,
                      duration: 100.ms,
                      curve: Curves.easeIn)
                  .fadeIn(begin: 0, duration: 100.ms, curve: Curves.easeIn)
            ],
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 13.h,
      width: 13.h,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colorPalette.navigationBarActive,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
