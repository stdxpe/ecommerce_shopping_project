import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class TextformfieldMain extends StatelessWidget {
  const TextformfieldMain({
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
      // color: Colors.red.withOpacity(0.5),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal!,
        ),
        child: TextFormField(
          autofocus: autoFocus!,
          cursorColor: textColor ?? context.colorPalette.permaBlackColor,
          obscureText: obscureText!,
          keyboardType: textInputType,
          style: context.textTheme.labelMedium!.copyWith(
            color: textColor ?? context.colorPalette.text,
            fontSize: context.textTheme.labelMedium!.fontSize!.h,
          ),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: lineColor ??
                    context.colorPalette.permaBlackColor.withOpacity(0.25),
                width: 1.0,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: lineColor ??
                    context.colorPalette.permaBlackColor.withOpacity(0.25),
                width: 2,
              ),
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
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
