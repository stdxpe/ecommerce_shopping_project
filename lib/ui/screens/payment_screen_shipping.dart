import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/models/address.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/payment_steps_navigation_provider.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/shipping_addresses_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_buttons_payment_shipping.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_buttons_profile_update_or_delete.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/horizontal_listview_address_chips.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_checkbox_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/ui/widgets/textformfield_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/k_credit_card_input_formatters.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class PaymentScreenShipping extends ConsumerStatefulWidget {
  const PaymentScreenShipping({super.key, this.isEditingMode = false});

  final bool? isEditingMode;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PaymentScreenShippingState();
}

class _PaymentScreenShippingState extends ConsumerState<PaymentScreenShipping> {
  Address? address;

  @override
  Widget build(BuildContext context) {
    address = ref.watch(selectedAddress);
    var controllers = ref.watch(addressTextControllers);

    return Scaffold(
      body: SizedBox(
        height: context.mediaQuery.size.height,
        width: context.mediaQuery.size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  if (widget.isEditingMode == false)
                    const TitleMain(
                      title: AppStrings.paymentScreenTitleShipping,
                      stepNumber: 1,
                    ),

                  ///// ADDRESSES TEXTFORMFIELDS
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Constants.kMainPaddingHorizontal.w * 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextformfieldMain(
                          hintText: AppStrings.hintAddressFullName,
                          controller: controllers.fullName,
                          onChanged: (value) {
                            controllers.fullName.text = value;
                            setState(() {});
                          },
                          textInputAction: TextInputAction.done,
                          inputFormatters: [
                            CreditCardHolderFormatter(),
                            FilteringTextInputFormatter.allow(
                                RegExp("[a-zA-Z ]")),
                          ],
                        ),
                        SizedBox(height: 50.h),
                        TextformfieldMain(
                          hintText: AppStrings.hintAddressTitle,
                          controller: controllers.addressTitle,
                          onChanged: (value) {
                            controllers.addressTitle.text = value;
                            setState(() {});
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(40),
                          ],
                        ),
                        SizedBox(height: 50.h),
                        TextformfieldMain(
                          hintText: AppStrings.hintAddressText,
                          controller: controllers.addressText,
                          onChanged: (value) {
                            controllers.addressText.text = value;
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 50.h),
                        Row(
                          children: [
                            Flexible(
                              child: TextformfieldMain(
                                hintText: AppStrings.hintAddressCity,
                                controller: controllers.city,
                                onChanged: (value) {
                                  controllers.city.text = value;
                                  setState(() {});
                                },
                              ),
                            ),
                            SizedBox(width: 30.w),
                            Flexible(
                              child: TextformfieldMain(
                                hintText: AppStrings.hintAddressZipCode,
                                controller: controllers.zipCode,
                                onChanged: (value) {
                                  controllers.zipCode.text = value;
                                  setState(() {});
                                },
                                textInputType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50.h),
                        TextformfieldMain(
                          hintText: AppStrings.hintAddressCountry,
                          controller: controllers.country,
                          onChanged: (value) {
                            controllers.country.text = value;
                            setState(() {});
                          },
                        ),

                        // ///// SAVED ADDRESSES SLIDER
                        if (ref.watch(addressesRawList).length > 1 &&
                            widget.isEditingMode == false)
                          const HorizontalListviewAddressChips(),

                        SizedBox(height: 80.h),
                        if (widget.isEditingMode == false && address == null)
                          SwitchCheckboxMain(
                            onChanged: () {
                              ref.read(addressCheckBox.notifier).state =
                                  !ref.read(addressCheckBox.notifier).state;
                            },
                            isChecked: ref.watch(addressCheckBox),
                            text: TextCustom(
                              text: AppStrings.saveAddressCheckbox,
                              textStyle: context.textTheme.labelSmall!,
                              color: context.colorPalette.text,
                            ),
                          ),
                        SizedBox(height: 100.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (widget.isEditingMode == true && address != null)
              Visibility(
                visible: context.isKeyboardOpen,
                child: BottomSheetButtonsProfileUpdateOrDelete(
                  onPressedDelete: () {
                    ref
                        .read(addressesProvider.notifier)
                        .deleteAddress(address: address!);
                    context.pop();
                    ref.read(disposeAddressControllers);
                  },
                  onPressedUpdate: () {
                    ref.read(addressesProvider.notifier).updateAddress(
                          selectedAddress: address!,
                          fullName: controllers.fullName.text,
                          addressTitle: controllers.addressTitle.text,
                          addressText: controllers.addressText.text,
                          city: controllers.city.text,
                          zipCode: controllers.zipCode.text,
                          country: controllers.country.text,
                        );
                    context.pop();
                    ref.read(disposeAddressControllers);
                  },
                ),
              ),
            if (widget.isEditingMode == true && address == null)
              Visibility(
                visible: context.isKeyboardOpen,
                child: BottomSheetButtonsProfileUpdateOrDelete(
                  isInCreateMode: true,
                  onPressedCreate: () {
                    ref.read(addressesProvider.notifier).createAddress(
                          fullName: controllers.fullName.text,
                          addressTitle: controllers.addressTitle.text,
                          addressText: controllers.addressText.text,
                          city: controllers.city.text,
                          zipCode: controllers.zipCode.text,
                          country: controllers.country.text,
                        );
                    context.pop();
                    ref.read(disposeAddressControllers);
                  },
                ),
              ),
            if (widget.isEditingMode == false)
              Visibility(
                visible: context.isKeyboardOpen,
                child: BottomSheetButtonsPaymentShipping(
                  onPressed: () {
                    /// Directing to the Credit Card Screen
                    ref
                        .read(paymentStepsNavigation.notifier)
                        .goSpecificIndex(targetIndex: 1);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
