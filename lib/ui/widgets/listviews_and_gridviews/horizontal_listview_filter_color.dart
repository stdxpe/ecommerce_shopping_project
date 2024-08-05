import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/services/dummy_data/dummy_filter_lists.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/single_color_picker_button.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class HorizontalListviewFilterColor extends StatelessWidget {
  const HorizontalListviewFilterColor({
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
        itemCount: dummyColorList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: Constants.kFilterSpacingBTWSizeAndColorHorizontal.w),
            child: GestureDetector(
              onTap: () {},
              child: SingleColorPickerButton(
                itemSize: height.h,
                isSelected: index % 3 == 0 ? true : false,
                itemColor: dummyColorList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
