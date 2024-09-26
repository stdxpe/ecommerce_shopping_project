import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/profile_edit_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_buttons_payment_shipping.dart';
import 'package:ecommerce_shopping_project/ui/widgets/textformfield_main.dart';
import 'package:ecommerce_shopping_project/utilities/k_text_input_formatters.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class BottomSheetProfileEdit extends ConsumerStatefulWidget {
  const BottomSheetProfileEdit({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BottomSheetProfileEditState();
}

class _BottomSheetProfileEditState
    extends ConsumerState<BottomSheetProfileEdit> {
  @override
  Widget build(BuildContext context) {
    var controllers = ref.watch(profileEditTextControllers);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: Constants.kMainPaddingHorizontal.w * 2),
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
                SizedBox(height: 50.h),
                TextformfieldMain(
                  hintText: AppStrings.hintProfileUsername,
                  controller: controllers.username,
                  onChanged: (value) {
                    controllers.username.text = value;
                    setState(() {});
                  },
                  textInputAction: TextInputAction.done,
                  inputFormatters: [LengthLimitingTextInputFormatter(30)],
                ),
                SizedBox(height: 50.h),
                TextformfieldMain(
                  enabled: false,
                  hintText: AppStrings.hintProfileEmail,
                  controller: controllers.email,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 50.h),
                TextformfieldMain(
                  hintText: AppStrings.hintProfilePhoneNumber,
                  controller: controllers.phoneNumber,
                  onChanged: (value) {
                    controllers.phoneNumber.text = value;
                    setState(() {});
                  },
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 50.h),
                TextformfieldMain(
                  hintText: AppStrings.hintProfileBirthday,
                  controller: controllers.birthday,
                  textInputType: TextInputType.datetime,
                  onChanged: (value) {
                    controllers.birthday.text = value;
                    setState(() {});
                  },
                  textInputAction: TextInputAction.done,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    DateTextInputFormatter(),
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.allow(RegExp("[0-9/ ]")),
                  ],
                ),
                SizedBox(height: 100.h),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Visibility(
              visible: context.isKeyboardOpen,
              child: BottomSheetButtonsPaymentShipping(
                buttonText: AppStrings.profileScreenButtonSaveProfile,
                onPressed: () {
                  ref.read(updateProfile);
                  context.pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
