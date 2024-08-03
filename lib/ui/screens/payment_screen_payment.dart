import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/credit_card_screen_bg_color_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/%20bottom_sheets/bottom_sheet_buttons_payment_method.dart';
import 'package:ecommerce_shopping_project/ui/widgets/%20bottom_sheets/bottom_sheet_buttons_profile_save_or_delete.dart';
import 'package:ecommerce_shopping_project/ui/widgets/sliders/credit_cards_slider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_checkbox_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/test_bg.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/ui/widgets/textformfield_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class PaymentScreenPayment extends StatelessWidget {
  PaymentScreenPayment({
    super.key,
    required this.onPressed,
    this.isCreateNewCardMode = false,
    this.onPressedSave,
    this.onPressedDelete,
  });

  final Function() onPressed;
  final bool? isCreateNewCardMode;
  final Function()? onPressedSave;
  final Function()? onPressedDelete;

  int creditCardIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const AppBarMain(),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: context.mediaQuery.size.height,
          width: context.mediaQuery.size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    if (isCreateNewCardMode == false)
                      const TitleMain(
                        title: AppStrings.paymentScreenTitlePayment,
                        stepNumber: 2,
                      ),

                    /// CREDIT CARDS SLIDER
                    CreditCardsSlider(
                      onIndexChanged: (cardIndex) {
                        // print('CardIndex: $cardIndex');
                        // creditCardIndex = cardIndex;
                        // print('creditCardIndex: $creditCardIndex');
                        // ref.read(coloredBgIndexProvider.notifier).state =
                        //     cardIndex;
                        // print(
                        //     'ref(coloredBgIndexProvider): ${ref.watch(coloredBgIndexProvider)}');
                        // ref
                        //     .read(colorIndexProvider.notifier)
                        //     .isAnimationStarted(result: true);
                        // ref
                        //     .read(colorIndexProvider.notifier)
                        //     .changeColor(cardIndex);
                      },
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Constants.kMainPaddingHorizontal.w * 2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(height: 50.h),
                          const TextformfieldMain(
                            text: AppStrings.paymentScreenCreditCardTextField1,
                          ),
                          SizedBox(height: 50.h),
                          const TextformfieldMain(
                            text: AppStrings.paymentScreenCreditCardTextField2,
                            textInputType: TextInputType.number,
                          ),
                          SizedBox(height: 50.h),
                          Row(
                            children: [
                              const Flexible(
                                child: TextformfieldMain(
                                  text: AppStrings
                                      .paymentScreenCreditCardTextField3,
                                  textInputType: TextInputType.number,
                                ),
                              ),
                              SizedBox(width: 30.w),
                              const Flexible(
                                child: TextformfieldMain(
                                  text: AppStrings
                                      .paymentScreenCreditCardTextField4,
                                  textInputType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 100.h),
                          if (isCreateNewCardMode == false)
                            SwitchCheckboxMain(
                              isChecked: true,
                              text: TextCustom(
                                text:
                                    AppStrings.paymentScreenCreditCardCheckBox,
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
              if (isCreateNewCardMode == true)
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
              if (isCreateNewCardMode == false)
                Visibility(
                  /// isKeyboardOpen
                  visible: MediaQuery.of(context).viewInsets.bottom == 0,
                  child: BottomSheetButtonsPaymentMethod(
                    onPressed: () {
                      onPressed();
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
