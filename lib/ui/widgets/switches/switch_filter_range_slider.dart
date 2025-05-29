import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/filter_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class SwitchFilterRangeSlider extends ConsumerWidget {
  const SwitchFilterRangeSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextCustom(
              text:
                  '\$${ref.watch(filterProvider).priceMin!.toStringAsFixed(0)}',
              textStyle: context.textTheme.displaySmall!,
              color: context.colorPalette.title,
            ),
            TextCustom(
              text:
                  '\$${ref.watch(filterProvider).priceMax!.toStringAsFixed(0)}',
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
          values: RangeValues(ref.watch(filterProvider).priceMin!,
              ref.watch(filterProvider).priceMax!),
          onChanged: (value) => ref
              .read(filterProvider.notifier)
              .setFilterParameter(priceMin: value.start, priceMax: value.end),
        ),
      ],
    );
  }
}
