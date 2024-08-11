import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/filter_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/minor_widgets/filters_screen_brand.dart';

class VerticalListviewFilterCollections extends ConsumerWidget {
  const VerticalListviewFilterCollections({
    super.key,
    required this.list,
    this.icon,
    this.height,
  });

  final List list;
  final IconData? icon;
  final double? height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => ref
              .read(filterProvider.notifier)
              .toggleCollectionElement(collection: list[index]),
          child: FiltersScreenBrand(
            isSelected:
                ref.watch(filterProvider).collections!.contains(list[index]),
            icon: icon,
            text: list[index],
            height: height?.h ?? 150,
          ),
        );
      },
    );
  }
}
