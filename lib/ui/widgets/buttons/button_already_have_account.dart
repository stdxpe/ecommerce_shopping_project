import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ButtonAlreadyHaveAccount extends StatelessWidget {
  const ButtonAlreadyHaveAccount({
    super.key,
    required this.onPressed,
    this.textStatic,
    required this.buttonText,
    this.textStaticColor,
    this.buttonTextColor,
    this.fontSize,
  });
  final Function onPressed;
  final String? textStatic;
  final String buttonText;
  final Color? textStaticColor;
  final Color? buttonTextColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            textStatic ?? '',
            textAlign: TextAlign.center,
            style: context.theme.textTheme.titleMedium!.copyWith(
              fontSize: fontSize,
              color: textStaticColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            buttonText,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.titleMedium!.copyWith(
              fontSize: fontSize,
              color: buttonTextColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
