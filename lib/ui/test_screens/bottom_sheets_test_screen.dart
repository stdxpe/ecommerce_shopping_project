import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/bottom_sheet_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';

class BottomSheetsTestScreen extends ConsumerWidget {
  const BottomSheetsTestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: ListView(
        children: [
          ButtonMain(
            text: 'Feature Selector',
            onPressed: () {
              //  ref
              //     .read(bottomSheetProvider.notifier)
              //     .featureSelector(context: context);
            },
          ),
          const SizedBox(height: 25),
          ButtonMain(
            text: 'Credit Cards',
            onPressed: () => ref
                .read(bottomSheetProvider.notifier)
                .creditCards(context: context),
          ),
          const SizedBox(height: 25),
          ButtonMain(
            text: 'Addresses',
            onPressed: () => ref
                .read(bottomSheetProvider.notifier)
                .addresses(context: context),
          ),
          const SizedBox(height: 25),
          ButtonMain(
            text: 'Profile Edit',
            onPressed: () => ref
                .read(bottomSheetProvider.notifier)
                .profileEdit(context: context),
          ),
          // heightRatio: 0.5,
          // child: BottomSheetFeatureSelector(),
          // child: BottomSheetProfileEdit(onPressed: () {})
          // child: PaymentScreenShipping(isCreateNewAddressMode: true),
          // child: PaymentScreenPayment(isCreateNewCardMode: true),
        ],
      ),
    );
  }
}
