import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_shopping_project/services/global_services/navigation_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/shipping_addresses_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/vertical_listview_profile_addresses.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/error_occured_widget.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/no_items_found_widget.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ShippingAddressesScreen extends ConsumerWidget {
  const ShippingAddressesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          children: [
            TitleMain(
              title: AppStrings.addressesScreenTitle,
              enableTitleAsBackButton: true,
              icon: Icons.add,
              paddingTop: 85.h,
              paddingHorizontal: Constants.kMainPaddingHorizontal.w,
              onPressed: () {
                ref.read(disposeAddressControllers);
                ref.read(selectedAddressIndex.notifier).state =
                    ref.read(addressesRawList).length - 1;
                context.push(Routes.bottomSheetAddresses);
              },
            ),
            ref.watch(addressesProvider).hasError
                ? const ErrorOccuredWidget()
                : (ref.watch(addressesProvider).value != null &&
                        ref.watch(addressesProvider).value!.isNotEmpty)
                    ? ref.watch(addressesProvider).when(
                        loading: () => const Center(
                            child: Center(child: CircularProgressIndicator())),
                        error: (error, stackTrace) =>
                            const ErrorOccuredWidget(),
                        data: (data) =>
                            VerticalListviewProfileAddresses(addresses: data))
                    : const NoItemsFoundWidget(),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
