import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/feature_selector_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/single_color_picker_button.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class HorizontalListviewFilterColor extends ConsumerWidget {
  const HorizontalListviewFilterColor({
    super.key,
    this.height = 140,
    required this.list,
  });

  final List<String> list;
  final double? height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: height!.h,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: Constants.kFilterSpacingBTWSizeAndColorHorizontal.w),
            child: GestureDetector(
              onTap: () =>
                  ref.read(colorSelectorProvider.notifier).state = index,
              child: SingleColorPickerButton(
                itemColorHexCode: list[index],
                isSelected: ref.watch(colorSelectorIsSelectedProvider(index)),
                itemSize: height!.h,
              ),
            ),
          );
        },
      ),
    );
  }
}
