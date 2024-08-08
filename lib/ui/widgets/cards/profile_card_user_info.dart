import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProfileCardUserInfo extends StatelessWidget {
  const ProfileCardUserInfo({
    super.key,
    required this.onPressedEdit,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePhoto,
    required this.cardHeight,
  });

  final Function() onPressedEdit;
  final String username;
  final String email;
  final String phoneNumber;
  final String profilePhoto;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    double paddingImageVertical = Constants.kProfileCardPaddingVertical;
    double paddingImageHorizontal = Constants.kProfileCardPaddingHorizontal;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),

      width: 1.sw,
      height: cardHeight.h + paddingImageVertical.h * 2,
      padding: EdgeInsets.symmetric(
        horizontal: paddingImageHorizontal.w,
        vertical: paddingImageVertical.h,
      ),
      decoration: BoxDecoration(
        color: context.colorPalette.sheetBackground,
        // color: Colors.green,
        // color: Colors.red,
        boxShadow: [
          BoxShadows.kBoxShadowPrimary(
            color: context.colorPalette.shadowSecondary,
          ),
        ],
      ),

      /// IMAGE and EDIT ICON
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: cardHeight.h,
            width: cardHeight.h,
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  profilePhoto,
                ),
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadows.kBoxShadowPrimary(
                  color: context.colorPalette.shadowSecondary,
                ),
              ],
            ),
          ),

          /// TEXTS
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Constants.kProfileCardSpacingBTWItemsVertical.h,
                horizontal: Constants.kProfileCardTextsPaddingHorizontal.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustom(
                    text: username,
                    textStyle: context.textTheme.bodyLarge!,
                    color: context.colorPalette.cardTextPrimary,
                    fontSizeCustom: 60,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom(
                        text: phoneNumber,
                        textStyle: context.textTheme.bodyMedium!,
                        color: context.colorPalette.cardTextSecondary,
                        fontWeightCustom: FontWeight.w500,
                      ),
                      SizedBox(
                        height: Constants.kProfileCardSpacingBTWTextsVertical.h,
                      ),
                      TextCustom(
                        text: email,
                        textStyle: context.textTheme.bodyMedium!,
                        color: context.colorPalette.cardTextSecondary,
                        fontWeightCustom: FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: onPressedEdit,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                color: Colors.transparent,
                height: 100.h,
                width: 100.h,
                child: Icon(
                  Icons.edit_note,
                  size: 70.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
