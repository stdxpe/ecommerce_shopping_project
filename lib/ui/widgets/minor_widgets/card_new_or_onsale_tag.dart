import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class CardNewOrOnsaleTag extends StatelessWidget {
  const CardNewOrOnsaleTag({super.key, required this.tagText});

  final String tagText;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: EdgeInsets.only(right: 8.w, left: 5.w, top: 5.h, bottom: 5.h),
        color: Colors.red,
        child: TextCustom(
          text: tagText,
          textStyle: context.textTheme.bodyMedium!,
          color: context.colorPalette.permaWhiteColor,
          fontSizeCustom: 20,
          fontWeightCustom: FontWeight.w700,
          textAlignCustom: TextAlign.left,
        ),
      ),
    );
  }
}
