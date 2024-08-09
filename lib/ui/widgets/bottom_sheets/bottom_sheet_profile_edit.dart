import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_buttons_payment_shipping.dart';
import 'package:ecommerce_shopping_project/ui/widgets/textformfield_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class BottomSheetProfileEdit extends StatelessWidget {
  const BottomSheetProfileEdit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: Constants.kMainPaddingHorizontal.w * 2,
              ),
              physics: const ClampingScrollPhysics(),
              children: [
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 300.h,
                          width: 300.h,
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                AppImages.productImage3,
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
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                /// TODO: ImagePicker Here
                              },
                              child: Container(
                                height: 200.h,
                                width: 200.h,
                                padding: EdgeInsets.zero,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: context.colorPalette.permaWhiteColor
                                      .withOpacity(0.20),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  CupertinoIcons.photo_camera_solid,
                                  color: context.colorPalette.permaWhiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const TextformfieldMain(
                  text: AppStrings.profileEditScreenTextfieldName,
                ),
                SizedBox(height: 50.h),
                const TextformfieldMain(
                  text: AppStrings.profileEditScreenTextfieldEmail,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 50.h),
                const TextformfieldMain(
                  text: AppStrings.profileEditScreenTextfieldPhone,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 50.h),
                const TextformfieldMain(
                  text: AppStrings.profileEditScreenTextfieldBirthday,
                  textInputType: TextInputType.datetime,
                ),
                SizedBox(height: 100.h),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Visibility(
              /// isKeyboardOpen
              visible: context.mediaQuery.viewInsets.bottom == 0,
              child: BottomSheetButtonsPaymentShipping(
                buttonText: AppStrings.profileScreenButtonSaveProfile,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
