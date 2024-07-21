import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class TextformfieldMain extends StatelessWidget {
  const TextformfieldMain({
    super.key,
    required this.text,
    this.color,
    this.paddingHorizontal,
  });

  final String text;
  final Color? color;
  final double? paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.withOpacity(0.5),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal ?? Constants.kMainPaddingHorizontal.w,
        ),
        child: TextFormField(
          selectionHeightStyle: BoxHeightStyle.includeLineSpacingBottom,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color ?? Colors.white, width: 2),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color ?? Colors.white, width: 2),
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
            ),
            hintText: text,
            hintStyle: context.theme.textTheme.bodyMedium!.copyWith(
              // color: context.theme.colorPalette.text.withOpacity(0.50),
              color: color ?? Colors.white,
              fontSize: 47.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.w,
              // height: 1,
            ),
          ),
        ),
      ),
    );
  }
}
