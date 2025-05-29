import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/credit_card_providers.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/payment_steps_navigation_provider.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/shipping_addresses_providers.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/shopping_cart_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_payment_summary_section.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class BottomSheetButtonsPaymentSummary extends ConsumerWidget {
  const BottomSheetButtonsPaymentSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var address = ref.watch(addressProviderForSummary);
    var creditCard = ref.watch(creditCardProviderForSummary);

    return Container(
      decoration: BoxDecoration(
        color: context.colorPalette.sheetBackground,
        boxShadow: [
          BoxShadows.kBoxShadowBottomSheet(
            color: context.colorPalette.shadowPrimary.withOpacity(0.2),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        left: Constants.kButtonPaddingHorizontal.w,
        right: Constants.kButtonPaddingHorizontal.w,
        bottom: Constants.kButtonPaddingBottom.h,
        top: 60.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          TitlePaymentSummarySection(
            onPressed: () {
              ref
                  .read(paymentStepsNavigation.notifier)
                  .goSpecificIndex(targetIndex: 0);
            },
            title: AppStrings.paymentScreenSummarySheetSectionAddress,
            subtext: address != null
                ? '${address.addressText}\n${address.city}, ${address.zipCode}, ${address.country}'
                : '???',
          ),
          SizedBox(height: 60.h),
          TitlePaymentSummarySection(
              onPressed: () {
                ref
                    .read(paymentStepsNavigation.notifier)
                    .goSpecificIndex(targetIndex: 1);
              },
              title: AppStrings.paymentScreenSummarySheetSectionPayment,
              subtext: creditCard != null
                  ? creditCard.cardNumber.hideCreditCardNumber
                  : '???'),
          SizedBox(height: 80.h),
          Row(
            children: [
              Expanded(
                child: ButtonMain(
                  onPressed: () {
                    ref.read(saveAddressIfCheckboxSelected);
                    ref.read(saveCreditCardIfCheckboxSelected);

                    /// TODO: Stripe Payment Here

                    /// Directing to the Result Screen
                    ref
                        .read(paymentStepsNavigation.notifier)
                        .goSpecificIndex(targetIndex: 3);
                  },
                  text:
                      '${AppStrings.paymentScreenSummarySheetButton}${ref.watch(shoppingCartProvider.notifier).getTotalAmount().inUSD}',
                  backgroundColor:
                      context.colorPalette.buttonMainBackgroundPrimary,
                  foregroundColor:
                      context.colorPalette.buttonMainForegroundPrimary,
                  paddingHorizontal: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
