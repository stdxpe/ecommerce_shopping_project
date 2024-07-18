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
    required this.cardWidth,
    required this.cardHeight,
    required this.fontSizePrimary,
    required this.fontSizeSecondary,
    required this.fontSizeTertiary,
    required this.paddingTextVertical,
    required this.paddingTextHorizontal,
    required this.paddingTextBetween,
    required this.paddingImageVertical,
    required this.paddingImageHorizontal,
  });

  final String username;
  final String email;
  final String phoneNumber;
  final String profilePhoto;
  final double cardWidth;
  final double cardHeight;
  final double fontSizePrimary;
  final double fontSizeSecondary;
  final double fontSizeTertiary;
  final double paddingTextVertical;
  final double paddingTextHorizontal;
  final double paddingImageVertical;
  final double paddingImageHorizontal;
  final double paddingTextBetween;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: paddingImageHorizontal.w,
          vertical: paddingImageVertical.h,
        ),
        height: cardHeight.h,
        width: cardWidth.w,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadows.kBoxShadowPrimary(
              color: context.theme.colorPalette.shadowPrimary,
            ),
          ],
        ),
        child: Card(
          margin: EdgeInsets.zero,
          color: Colors.white,
          borderOnForeground: true,
          clipBehavior: Clip.none,
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ),
          elevation: 0,

          /// TOTAL CARD
          child: Row(
            children: [
              /// CARD IMAGE
              Container(
                height: cardHeight.h,
                width: cardHeight.h,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      profilePhoto,
                    ),
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadows.kBoxShadowPrimary(
                      color: context.theme.colorPalette.shadowPrimary,
                    ),
                  ],
                ),
              ),

              /// CARD TEXTS
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: paddingTextHorizontal.w,
                    vertical: paddingTextVertical.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            // color: Colors.yellow,
                            height: fontSizePrimary.h,
                            child: Text(
                              username,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  context.theme.textTheme.bodyLarge!.copyWith(
                                color:
                                    context.theme.colorPalette.cardTextPrimary,
                                fontSize: fontSizePrimary.h,
                                height: 1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                // color: Colors.yellow,
                                height: fontSizeSecondary.h,
                                child: Text(
                                  email,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.theme.textTheme.bodyMedium!
                                      .copyWith(
                                    color: context
                                        .theme.colorPalette.cardTextSecondary,
                                    fontSize: fontSizeSecondary.h,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                    height: 1,
                                    shadows: [
                                      BoxShadows.kBoxShadowProductCardText(
                                        color: context
                                            .theme.colorPalette.permaWhiteColor
                                            .withOpacity(0.54),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: paddingTextBetween.h),
                              SizedBox(
                                // color: Colors.yellowAccent,
                                height: fontSizeSecondary.h,
                                child: Text(
                                  phoneNumber,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.theme.textTheme.bodyMedium!
                                      .copyWith(
                                    color: context
                                        .theme.colorPalette.cardTextSecondary,
                                    fontSize: fontSizeSecondary.h,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                    height: 1,
                                    shadows: [
                                      BoxShadows.kBoxShadowProductCardText(
                                        color: context
                                            .theme.colorPalette.permaWhiteColor
                                            .withOpacity(0.54),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        // color: Colors.blue.withOpacity(0.5),
                        alignment: Alignment.center,
                        height: fontSizePrimary.h,
                        width: fontSizePrimary.h,
                        child: FittedBox(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.edit_note,
                            size: fontSizePrimary.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
