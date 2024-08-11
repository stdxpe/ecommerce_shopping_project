import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/filter_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/single_size_picker_button.dart';

class SwitchFilterSizeSelector extends ConsumerWidget {
  const SwitchFilterSizeSelector({
    super.key,
    required this.list,
    required this.height,
  });

  final List<String> list;
  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: height.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: list
            .mapIndexed(
              (index, element) => GestureDetector(
                onTap: () => ref
                    .read(filterProvider.notifier)
                    .toggleSizeElement(size: list[index]),
                child: SingleSizePickerButton(
                  isSelected:
                      ref.watch(filterProvider).sizes!.contains(list[index]),
                  item: list[index],
                  itemSize: height.h,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
