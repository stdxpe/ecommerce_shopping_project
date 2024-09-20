import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/models/address.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/payment_screen_steps_navigation_provider.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/shipping_addresses_providers.dart';
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
    this.initialAddress,
  });

  final bool? isCreateNewAddressMode;
  final Address? initialAddress;

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
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: Constants.kMainPaddingHorizontal.w * 2),
                children: [
                  if (isCreateNewAddressMode == false)
                    const TitleMain(
                      title: AppStrings.paymentScreenTitleShipping,
                      stepNumber: 1,
                      paddingHorizontal: 0,
                    ),
                  if (isCreateNewAddressMode!) SizedBox(height: 50.h),
                  TextformfieldMain(
                    controller: ref.watch(textControllerAddressFullName(
                        initialAddress?.fullName)),
                    hintText: AppStrings.paymentScreenShippingTextField0,
                  ),
                  SizedBox(height: 50.h),
                  TextformfieldMain(
                    controller: ref.watch(textControllerAddressTitle(
                        initialAddress?.addressTitle)),
                    hintText: AppStrings.paymentScreenShippingTextField1,
                  ),
                  SizedBox(height: 50.h),
                  TextformfieldMain(
                    controller: ref.watch(
                        textControllerAddress(initialAddress?.addressText)),
                    hintText: AppStrings.paymentScreenShippingTextField2,
                    textInputType: TextInputType.multiline,
                  ),
                  SizedBox(height: 50.h),
                  Row(
                    children: [
                      Flexible(
                        child: TextformfieldMain(
                          controller: ref.watch(
                              textControllerAddressCity(initialAddress?.city)),
                          hintText: AppStrings.paymentScreenShippingTextField3,
                        ),
                      ),
                      SizedBox(width: 30.w),
                      Flexible(
                        child: TextformfieldMain(
                          controller: ref.watch(textControllerAddressZipCode(
                              initialAddress?.zipCode)),
                          hintText: AppStrings.paymentScreenShippingTextField4,
                          textInputType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  TextformfieldMain(
                    controller: ref.watch(
                        textControllerAddressCountry(initialAddress?.country)),
                    hintText: AppStrings.paymentScreenShippingTextField5,
                  ),
                  SizedBox(height: 100.h),
                  if (isCreateNewAddressMode == false)
                    SwitchCheckboxMain(
                      onChanged: () {
                        ref.read(addressCheckBox.notifier).state =
                            !ref.read(addressCheckBox.notifier).state;
                      },
                      isChecked: ref.watch(addressCheckBox),
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
            if (isCreateNewAddressMode == true && initialAddress != null)
              Visibility(
                visible: context.isKeyboardOpen,
                child: BottomSheetButtonsProfileSaveOrDelete(
                  onPressedDelete: () {
                    if (initialAddress != null) {
                      ref
                          .read(addressesProvider.notifier)
                          .deleteAddress(address: initialAddress!);
                      context.pop();
                      ref.read(addressesProvider.notifier).disposeControllers();
                    }
                  },
                  onPressedSave: () {
                    ref
                        .read(addressesProvider.notifier)
                        .updateAddress(initialAddress: initialAddress!);
                    context.pop();
                    ref.read(addressesProvider.notifier).disposeControllers();
                  },
                ),
              ),
            if (isCreateNewAddressMode == true && initialAddress == null)
              Visibility(
                visible: context.isKeyboardOpen,
                child: BottomSheetButtonsProfileSaveOrDelete(
                  isInCreateMode: true,
                  onPressedCreate: () {
                    ref.read(addressesProvider.notifier).createAddress();
                    context.pop();
                    ref.read(addressesProvider.notifier).disposeControllers();
                  },
                ),
              ),
            if (isCreateNewAddressMode == false)
              Visibility(
                visible: context.isKeyboardOpen,
                child: BottomSheetButtonsPaymentShipping(
                  onPressed: () {
                    ref
                        .read(paymentScreenNavigationProvider.notifier)
                        .goNextStep(context, ref);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
