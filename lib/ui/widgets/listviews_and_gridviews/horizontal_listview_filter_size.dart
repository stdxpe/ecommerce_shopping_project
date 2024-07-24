import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/dummy_filter_lists.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/single_size_picker_button.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class HorizontalListviewFilterSize extends StatelessWidget {
  const HorizontalListviewFilterSize({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: dummySizeList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: Constants.kFilterSpacingBTWSizeAndColorHorizontal.w,
            ),
            child: GestureDetector(
              onTap: () {},
              child: SingleSizePickerButton(
                itemSize: height.h,
                isSelected: index % 3 == 0 ? true : false,
                item: dummySizeList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
