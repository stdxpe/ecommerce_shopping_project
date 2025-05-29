import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/shipping_addresses_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/address_selection_chip.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class HorizontalListviewAddressChips extends ConsumerWidget {
  const HorizontalListviewAddressChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(top: 75.h),
      child: SizedBox(
        height: 100.h,
        child: ListView.builder(
          clipBehavior: Clip.none,
          padding: EdgeInsets.zero,
          itemCount: ref.watch(addressesRawList).length,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final reversed = ref.watch(addressesRawList).reversed.toList();
            final item = reversed[index];
            final newIndex = ref.watch(addressesRawList).length - 1 - index;
            return Padding(
              padding: EdgeInsets.only(
                  right: Constants.kFilterSpacingBTWChipsHorizontal.w),
              child: GestureDetector(
                onTap: () =>
                    ref.read(selectedAddressIndex.notifier).state = newIndex,
                child: AddressSelectionChip(
                  height: 100.h,
                  isSelected: ref.watch(selectedAddressIndex) == newIndex
                      ? true
                      : false,
                  text: item != null
                      ? item.addressTitle
                      : AppStrings.newAddressChip,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
