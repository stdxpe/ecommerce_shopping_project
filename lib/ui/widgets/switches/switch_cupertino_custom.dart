import 'package:flutter/cupertino.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SwitchCupertinoCustom extends StatelessWidget {
  const SwitchCupertinoCustom(
      {super.key, required this.switchState, required this.onChanged});

  final bool switchState;
  final Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: switchState,
      onChanged: (value) => onChanged(),
      thumbColor: context.colorPalette.scaffoldBackground,
      activeColor: context.colorPalette.text,
      trackColor: context.colorPalette.text.withOpacity(0.13),
    );
  }
}
