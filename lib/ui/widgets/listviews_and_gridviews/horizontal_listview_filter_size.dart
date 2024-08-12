import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/cart_feature_selector_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/single_size_picker_button.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class HorizontalListviewFilterSize extends ConsumerWidget {
  const HorizontalListviewFilterSize({
    super.key,
    required this.list,
    this.height = 140,
  });

  final List<String> list;
  final double? height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: height!.h,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: Constants.kFilterSpacingBTWSizeAndColorHorizontal.w,
            ),
            child: GestureDetector(
              onTap: () =>
                  ref.read(sizeSelectorProvider.notifier).state = index,
              child: SingleSizePickerButton(
                item: list[index],
                isSelected: ref.watch(sizeSelectorIsSelectedProvider(index)),
                itemSize: height!.h,
              ),
            ),
          );
        },
      ),
    );
  }
}
