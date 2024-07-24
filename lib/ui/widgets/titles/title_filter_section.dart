import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleFilterSection extends StatelessWidget {
  const TitleFilterSection({
    super.key,
    required this.title,
    this.paddingTop,
  });

  final String title;
  final double? paddingTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop ?? Constants.kFilterSpacingBTWTitlesVertical.h * 2,
        bottom: Constants.kFilterSpacingBTWTitlesVertical.h,
      ),
      child: TextCustom(
        text: title,
        textStyle: context.textTheme.displaySmall!,
        color: context.colorPalette.title,
      ),
    );
  }
}
