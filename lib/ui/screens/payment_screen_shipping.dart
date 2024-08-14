import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/payment_screen_steps_navigation_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_buttons_payment_shipping.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_buttons_profile_save_or_delete.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_checkbox_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/ui/widgets/textformfield_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class PaymentScreenShipping extends ConsumerWidget {
  const PaymentScreenShipping({
    super.key,
    this.isCreateNewAddressMode = false,
    this.onPressedSave,
    this.onPressedDelete,
  });

  final bool? isCreateNewAddressMode;
  final Function()? onPressedSave;
  final Function()? onPressedDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SizedBox(
        height: context.mediaQuery.size.height,
        width: context.mediaQuery.size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: Constants.kMainPaddingHorizontal.w * 2,
                ),
                physics: const ClampingScrollPhysics(),
                children: [
                  if (isCreateNewAddressMode == false)
                    const TitleMain(
                      title: AppStrings.paymentScreenTitleShipping,
                      stepNumber: 1,
                      paddingHorizontal: 0,
                    ),
                  if (isCreateNewAddressMode!) SizedBox(height: 50.h),
                  const TextformfieldMain(
                    hintText: AppStrings.paymentScreenShippingTextField1,
                  ),
                  SizedBox(height: 50.h),
                  const TextformfieldMain(
                    hintText: AppStrings.paymentScreenShippingTextField2,

                    /// TODO: Multiline address entry.
                    textInputType: TextInputType.multiline,
                  ),
                  SizedBox(height: 50.h),
                  Row(
                    children: [
                      const Flexible(
                        child: TextformfieldMain(
                          hintText: AppStrings.paymentScreenShippingTextField3,
                        ),
                      ),
                      SizedBox(width: 30.w),
                      const Flexible(
                        child: TextformfieldMain(
                          hintText: AppStrings.paymentScreenShippingTextField4,
                          textInputType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  const TextformfieldMain(
                    hintText: AppStrings.paymentScreenShippingTextField5,
                  ),
                  SizedBox(height: 100.h),
                  if (isCreateNewAddressMode == false)
                    SwitchCheckboxMain(
                      isChecked: true,
                      text: TextCustom(
                        text: AppStrings.paymentScreenShippingCheckBox,
                        textStyle: context.textTheme.labelSmall!,
                        color: context.colorPalette.text,
                      ),
                    ),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
            if (isCreateNewAddressMode == true)
              Visibility(
                /// isKeyboardOpen
                visible: MediaQuery.of(context).viewInsets.bottom == 0,
                child: BottomSheetButtonsProfileSaveOrDelete(
                  onPressedDelete: () {
                    onPressedDelete!();
                  },
                  onPressedSave: () {
                    onPressedSave!();
                  },
                ),
              ),
            if (isCreateNewAddressMode == false)
              Visibility(
                /// isKeyboardOpen
                visible: MediaQuery.of(context).viewInsets.bottom == 0,
                child: BottomSheetButtonsPaymentShipping(
                  onPressed: () => ref
                      .read(paymentScreenNavigationProvider.notifier)
                      .goNextStep(context, ref),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
