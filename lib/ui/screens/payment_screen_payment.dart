import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/models/credit_card.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/credit_card_providers.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/payment_screen_steps_navigation_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_buttons_payment_method.dart';
import 'package:ecommerce_shopping_project/ui/widgets/bottom_sheets/bottom_sheet_buttons_profile_update_or_delete.dart';
import 'package:ecommerce_shopping_project/ui/widgets/sliders/credit_cards_slider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_checkbox_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/ui/widgets/textformfield_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/k_credit_card_input_formatters.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class PaymentScreenPayment extends ConsumerStatefulWidget {
  const PaymentScreenPayment({super.key, this.isEditingMode = false});

  final bool? isEditingMode;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PaymentScreenPaymentState();
}

class _PaymentScreenPaymentState extends ConsumerState<PaymentScreenPayment> {
  FocusNode cvvFocusNode = FocusNode();
  CreditCard? card;

  @override
  void initState() {
    super.initState();
    cvvFocusNode.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    cvvFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    card = ref.watch(selectedCreditCard);
    var controllers = ref.watch(creditCardTextControllers);

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
                      title: AppStrings.paymentScreenTitlePayment,
                      stepNumber: 2,
                    ),

                  ///// CREDIT CARDS SLIDER
                  CreditCardsSlider(isCvvFocused: cvvFocusNode.hasPrimaryFocus),

                  ///// CREDIT CARDS TEXTFORMFIELDS
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Constants.kMainPaddingHorizontal.w * 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextformfieldMain(
                          controller: controllers.cardHolder,
                          onChanged: (value) {
                            controllers.cardHolder.text = value;
                            setState(() {});
                          },
                          hintText: AppStrings.hintCreditCardHolder,
                          textInputAction: TextInputAction.done,
                          inputFormatters: [
                            CreditCardHolderFormatter(),
                            FilteringTextInputFormatter.allow(
                                RegExp("[a-zA-Z ]")),
                          ],
                        ),
                        SizedBox(height: 50.h),
                        TextformfieldMain(
                          controller: controllers.cardNumber,
                          onChanged: (value) {
                            controllers.cardNumber.text = value;
                            setState(() {});
                          },
                          hintText: AppStrings.hintCreditCardNumber,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                            CreditCardNumberFormatter(),
                          ],
                        ),
                        SizedBox(height: 50.h),
                        Row(
                          children: [
                            Flexible(
                              child: TextformfieldMain(
                                controller: controllers.validThru,
                                onChanged: (value) {
                                  controllers.validThru.text = value;
                                  setState(() {});
                                },
                                hintText: AppStrings.hintCreditCardValidThru,
                                textInputType: TextInputType.number,
                                inputFormatters: [
                                  CreditCardDateFormatter(),
                                  LengthLimitingTextInputFormatter(5),
                                ],
                              ),
                            ),
                            SizedBox(width: 30.w),
                            Flexible(
                              child: TextformfieldMain(
                                focusNode: cvvFocusNode,
                                controller: controllers.cvv,
                                onChanged: (value) {
                                  controllers.cvv.text = value;
                                  setState(() {});
                                },
                                hintText: AppStrings.hintCreditCardCvv,
                                textInputType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(3),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 80.h),
                        if (widget.isEditingMode == false && card == null)
                          SwitchCheckboxMain(
                            onChanged: () {
                              ref.read(creditCardCheckBox.notifier).state =
                                  !ref.read(creditCardCheckBox.notifier).state;
                            },
                            isChecked: ref.watch(creditCardCheckBox),
                            text: TextCustom(
                              text: AppStrings.saveCreditCardCheckBox,
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
            if (widget.isEditingMode == true && card != null)
              Visibility(
                visible: context.isKeyboardOpen,
                child: BottomSheetButtonsProfileUpdateOrDelete(
                  onPressedDelete: () {
                    ref
                        .read(creditCardsProvider.notifier)
                        .deleteCreditCard(creditCard: card!);
                    context.pop();
                    ref.read(disposeCreditCardControllers);
                  },
                  onPressedUpdate: () {
                    ref.read(creditCardsProvider.notifier).updateCreditCard(
                          selectedCreditCard: card!,
                          cardHolder: controllers.cardHolder.text,
                          cardNumber: controllers.cardNumber.text,
                          validThru: controllers.validThru.text,
                          cvv: controllers.cvv.text,
                        );
                    context.pop();
                    ref.read(disposeCreditCardControllers);
                  },
                ),
              ),
            if (widget.isEditingMode == true && card == null)
              Visibility(
                visible: context.isKeyboardOpen,
                child: BottomSheetButtonsProfileUpdateOrDelete(
                  isInCreateMode: true,
                  onPressedCreate: () {
                    ref.read(creditCardsProvider.notifier).createCreditCard(
                          cardHolder: controllers.cardHolder.text,
                          cardNumber: controllers.cardNumber.text,
                          validThru: controllers.validThru.text,
                          cvv: controllers.cvv.text,
                        );
                    context.pop();
                    ref.read(disposeCreditCardControllers);
                  },
                ),
              ),
            if (widget.isEditingMode == false)
              Visibility(
                visible: context.isKeyboardOpen,
                child: BottomSheetButtonsPaymentMethod(
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
