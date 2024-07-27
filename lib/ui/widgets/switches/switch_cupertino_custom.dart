import 'package:flutter/cupertino.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SwitchCupertinoCustom extends StatefulWidget {
  SwitchCupertinoCustom({
    super.key,
    required this.onChanged,
    this.switchState = false,
  });

  bool? switchState;
  final Function() onChanged;

  @override
  State<SwitchCupertinoCustom> createState() => _SwitchCupertinoCustomState();
}

class _SwitchCupertinoCustomState extends State<SwitchCupertinoCustom> {
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: widget.switchState!,
      onChanged: (value) {
        setState(() {
          widget.switchState = value;
        });
        widget.onChanged();
      },
      thumbColor: context.colorPalette.scaffoldBackground,
      activeColor: context.colorPalette.text,
      trackColor: context.colorPalette.text.withOpacity(0.13),
    );
  }
}
