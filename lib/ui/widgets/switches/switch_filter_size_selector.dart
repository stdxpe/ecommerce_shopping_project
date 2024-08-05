import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/services/dummy_data/dummy_filter_lists.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/single_size_picker_button.dart';

class SwitchFilterSizeSelector extends StatelessWidget {
  const SwitchFilterSizeSelector({super.key, required this.height});

  final double height;

  /// TODO: Select Index Riverpod method here
  // int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SingleSizePickerButton(
            itemSize: height.h,
            isSelected: true,
            item: dummySizeList[0],
          ),
          SingleSizePickerButton(
            itemSize: height.h,
            isSelected: false,
            item: dummySizeList[1],
          ),
          SingleSizePickerButton(
            itemSize: height.h,
            isSelected: false,
            item: dummySizeList[2],
          ),
          SingleSizePickerButton(
            itemSize: height.h,
            isSelected: false,
            item: dummySizeList[3],
          ),
          SingleSizePickerButton(
            itemSize: height.h,
            isSelected: false,
            item: dummySizeList[4],
          ),
        ],
      ),
    );
  }
}
