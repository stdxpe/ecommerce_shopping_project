import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SwitchFilterRangeSlider extends StatefulWidget {
  /// TODO: Remove Stateful Widget when Riverpod arrives
  const SwitchFilterRangeSlider({super.key});

  @override
  State<SwitchFilterRangeSlider> createState() =>
      _SwitchFilterRangeSliderState();
}

class _SwitchFilterRangeSliderState extends State<SwitchFilterRangeSlider> {
  ///
  RangeValues _currentRangeValues = const RangeValues(150, 750);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextCustom(
              text: '\$${_currentRangeValues.start.toStringAsFixed(0)}',
              textStyle: context.textTheme.displaySmall!,
              color: context.colorPalette.title,
            ),
            TextCustom(
              text: '\$${_currentRangeValues.end.toStringAsFixed(0)}',
              textStyle: context.textTheme.displaySmall!,
              color: context.colorPalette.title,
            ),
          ],
        ),
        RangeSlider(
          activeColor: context.colorPalette.title,
          inactiveColor: context.colorPalette.title.withOpacity(0.25),
          min: 0,
          divisions: 100,
          max: 1000,
          values: _currentRangeValues,
          onChanged: (value) {
            setState(
              () {
                _currentRangeValues = value;
              },
            );
          },
        ),
      ],
    );
  }
}
