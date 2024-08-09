import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/filter_selector_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SwitchFilterRangeSlider extends ConsumerWidget {
  const SwitchFilterRangeSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RangeValues currentRangeValues = ref.watch(filterPriceRangeProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextCustom(
              text: '\$${currentRangeValues.start.toStringAsFixed(0)}',
              textStyle: context.textTheme.displaySmall!,
              color: context.colorPalette.title,
            ),
            TextCustom(
              text: '\$${currentRangeValues.end.toStringAsFixed(0)}',
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
          values: currentRangeValues,
          onChanged: (value) =>
              ref.read(filterPriceRangeProvider.notifier).state = value,
        ),
      ],
    );
  }
}
