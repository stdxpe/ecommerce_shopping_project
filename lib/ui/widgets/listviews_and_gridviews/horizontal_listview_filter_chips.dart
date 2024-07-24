import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/filters_screen_chip.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class HorizontalListviewFilterChips extends StatelessWidget {
  const HorizontalListviewFilterChips({
    super.key,
    required this.filterList,
    this.icon,
    this.height,
  });

  final List filterList;
  final IconData? icon;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?.h ?? 100.h,
      child: ListView.builder(
        clipBehavior: Clip.none,
        padding: EdgeInsets.zero,
        itemCount: filterList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: Constants.kFilterSpacingBTWChipsHorizontal.w,
            ),
            child: FiltersScreenChip(
              icon: icon,
              onPressed: () {},
              text: filterList[index],
              height: height?.h ?? 100,
            ),
          );
        },
      ),
    );
  }
}
