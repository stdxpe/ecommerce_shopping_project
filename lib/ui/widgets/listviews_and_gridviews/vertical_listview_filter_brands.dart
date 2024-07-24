import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/filters_screen_brand.dart';

class VerticalListviewFilterBrands extends StatelessWidget {
  const VerticalListviewFilterBrands({
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
    return ListView.builder(
      shrinkWrap: true,
      // clipBehavior: Clip.none,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: filterList.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return FiltersScreenBrand(
          icon: icon,
          onPressed: () {},
          text: filterList[index],
          height: height?.h ?? 150,
        );
      },
    );
  }
}
