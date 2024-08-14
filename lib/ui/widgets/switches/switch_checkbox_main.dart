import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SwitchCheckboxMain extends StatelessWidget {
  const SwitchCheckboxMain({
    super.key,
    required this.text,
    required this.onChanged,
    required this.isChecked,
    this.checkedColor,
    this.uncheckedColor,
  });

  final TextCustom text;
  final bool isChecked;
  final Function() onChanged;
  final Color? checkedColor;
  final Color? uncheckedColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(),
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              decoration: BoxDecoration(
                color: uncheckedColor ??
                    context.colorPalette.text.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: MSHCheckbox(
                size: 60.h,
                value: isChecked,
                colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                  checkedColor: checkedColor ?? context.colorPalette.text,
                  uncheckedColor:
                      uncheckedColor ?? context.colorPalette.scaffoldBackground,
                  disabledColor: context.colorPalette.text,
                ),
                style: MSHCheckboxStyle.stroke,
                duration: const Duration(milliseconds: 300),
                onChanged: (selected) {
                  onChanged();
                },
              ),
            ),
            SizedBox(width: 35.w),
            Flexible(child: text),
          ],
        ),
      ),
    );
  }
}
