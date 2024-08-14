import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class TextformfieldMain extends StatelessWidget {
  const TextformfieldMain({
    super.key,
    this.controller,
    this.validator,
    required this.hintText,
    this.textColor,
    this.lineColor,
    this.paddingHorizontal = 0,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.autoFocus = false,
    this.focusNode,
    this.onFocusTap,
    this.textInputAction,
    this.textInputFormatter,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  final FocusNode? focusNode;
  final Function()? onFocusTap;
  final Function(String value)? onChanged;

  final TextInputFormatter? textInputFormatter;
  final TextInputAction? textInputAction;
  final String hintText;
  final Color? textColor;
  final Color? lineColor;
  final double? paddingHorizontal;
  final TextInputType? textInputType;
  final bool? obscureText;
  final bool? autoFocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal!,
      ),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        focusNode: focusNode,
        autovalidateMode: AutovalidateMode.always,
        textInputAction: textInputAction,
        autofocus: autoFocus!,
        cursorColor: textColor ?? context.colorPalette.text,
        obscureText: obscureText!,
        keyboardType: textInputType,
        style: context.textTheme.labelMedium!.copyWith(
          color: textColor ?? context.colorPalette.text,
          fontSize: context.textTheme.labelMedium!.fontSize!.h,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: context.textTheme.labelMedium!.copyWith(
            color: textColor?.withOpacity(0.8) ??
                context.colorPalette.text.withOpacity(0.50),
            fontSize: context.textTheme.labelMedium!.fontSize!.h,
          ),
          errorMaxLines: 2,
          errorStyle: context.textTheme.labelMedium!.copyWith(
            color: ColorPalette.favoriteRed,
            fontSize: context.textTheme.labelMedium!.fontSize!.h,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: lineColor ?? context.colorPalette.text.withOpacity(0.25),
              width: 1.0,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: lineColor ?? context.colorPalette.text.withOpacity(0.25),
              width: 2,
            ),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorPalette.favoriteRed,
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: lineColor ?? context.colorPalette.text.withOpacity(0.25),
            ),
          ),
        ),
      ),
    );
  }
}
