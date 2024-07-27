import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SwitchCheckboxMain extends StatefulWidget {
  SwitchCheckboxMain({
    super.key,
    required this.text,
    this.isChecked = false,
    this.checkedColor,
    this.uncheckedColor,
  });

  /// CheckBox Text Theme: context.textTheme.labelSmall
  final TextCustom text;
  bool? isChecked;
  final Color? checkedColor;
  final Color? uncheckedColor;

  @override
  State<SwitchCheckboxMain> createState() => _SwitchCheckboxMainState();
}

class _SwitchCheckboxMainState extends State<SwitchCheckboxMain> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isChecked = !widget.isChecked!;
        });
      },
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              decoration: BoxDecoration(
                color: widget.uncheckedColor ?? Colors.white70,
                shape: BoxShape.circle,
              ),
              child: MSHCheckbox(
                size: 60.h,
                value: widget.isChecked!,
                colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                  checkedColor: context.colorPalette.permaBlackColor,
                  uncheckedColor: context.colorPalette.permaWhiteColor,
                  disabledColor: context.colorPalette.permaWhiteColor,
                ),
                style: MSHCheckboxStyle.stroke,
                duration: const Duration(milliseconds: 300),
                onChanged: (selected) {
                  setState(() {
                    widget.isChecked = selected;
                  });
                },
              ),
            ),
            SizedBox(width: 35.w),
            Flexible(child: widget.text),
          ],
        ),
      ),
    );
  }
}
