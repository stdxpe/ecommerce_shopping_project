import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProfileCardUserInfo extends StatelessWidget {
  const ProfileCardUserInfo({
    super.key,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePhoto,
    required this.cardHeight,
  });

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
        color: context.theme.colorPalette.sheetBackground,
        // color: Colors.green,
        // color: Colors.red,
        boxShadow: [
          BoxShadows.kBoxShadowPrimary(
            color: context.theme.colorPalette.shadowSecondary,
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
                  color: context.theme.colorPalette.shadowSecondary,
                ),
              ],
            ),
          ),
          // SizedBox(width: Constants.kPaddingProfileCardTextsHorizontal.h),

          /// TEXTS
          Expanded(
            child: Container(
              // color: Colors.red.withOpacity(0.5),
              padding: EdgeInsets.symmetric(
                vertical: Constants.kProfileCardSpacingBTWItemsVertical.h,
                horizontal: Constants.kPaddingProfileCardTextsHorizontal.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: context.colorPalette.cardTextPrimary,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        phoneNumber,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: context.colorPalette.cardTextSecondary,
                        ),
                      ),
                      SizedBox(
                        height: Constants.kPaddingProfileCardTextsBetween.h,
                      ),
                      Text(
                        email,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: context.colorPalette.cardTextSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              // color: Colors.blue.withOpacity(0.5),

              height: Constants.kPaddingProfileCardFontHeightPrimary.h,
              width: Constants.kPaddingProfileCardFontHeightPrimary.h,
              child: Icon(
                Icons.edit_note,
                size: Constants.kPaddingProfileCardFontHeightPrimary.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
