import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class TextformfieldSearchBox extends StatelessWidget {
  const TextformfieldSearchBox({
    super.key,
    required this.text,
    this.textColor,
    this.lineColor,
    this.paddingHorizontal = 0,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.autoFocus = false,
  });

  final String text;
  final Color? textColor;
  final Color? lineColor;
  final double? paddingHorizontal;
  final TextInputType? textInputType;
  final bool? obscureText;
  final bool? autoFocus;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,

      alignment: Alignment.center,
      // color: Colors.red.withOpacity(0.5),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal!,
          vertical: 0,
        ),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          autofocus: autoFocus!,
          cursorColor: textColor ?? context.colorPalette.permaBlackColor,
          obscureText: obscureText!,
          keyboardType: textInputType,
          style: context.textTheme.labelMedium!.copyWith(
            color: textColor ?? context.colorPalette.text,
            fontSize: context.textTheme.labelMedium!.fontSize!.h,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 35.w,
              vertical: 20.h,
            ),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 2,
              minHeight: 2,
            ),
            suffixIcon: InkWell(
                borderRadius: BorderRadius.circular(100.r),
                child: Padding(
                  padding: EdgeInsets.only(right: 15.w, left: 15.w),
                  child: Icon(
                    Icons.clear,
                    size: 60.h,
                    color: context.colorPalette.appBarForeground,
                  ),
                ),
                onTap: () {}),

            fillColor: Colors.black12,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),

            hintText: text,
            hintStyle: context.textTheme.labelMedium!.copyWith(
              color: textColor?.withOpacity(0.8) ??
                  context.colorPalette.text.withOpacity(0.50),
              fontSize: context.textTheme.labelMedium!.fontSize!.h,
            ),
            // labelStyle:
          ),
        ),
      ),
    );
  }
}
