import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:flutter_slidable/flutter_slidable.dart";

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class DismissibleDeleteWidget extends StatelessWidget {
  const DismissibleDeleteWidget({
    required this.child,
    required this.uniqueKey,
    super.key,
    this.dismissibleEnabled = false,
    this.onDismissed,
    this.height,
  });

  final bool? dismissibleEnabled;
  final double? height;
  final Widget child;
  final String uniqueKey;
  final Function()? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      direction: Axis.horizontal,
      closeOnScroll: true,
      useTextDirection: true,
      enabled: dismissibleEnabled!,
      key: ValueKey(uniqueKey),
      endActionPane: ActionPane(
        extentRatio: 0.30,
        motion: const ScrollMotion(),
        dragDismissible: false,
        dismissible: DismissiblePane(
          // motion: DrawerMotion(),
          key: ValueKey(uniqueKey),
          onDismissed: () {},
        ),
        children: [
          CustomSlidableAction(
            key: ValueKey(uniqueKey),
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            foregroundColor: ColorPalette.dismissibleFg,
            autoClose: false,
            child: Container(
                height: height ?? 200.w,
                width: double.infinity,
                padding: EdgeInsets.zero,
                color: ColorPalette.dismissibleBg,
                child: const Icon(Icons.delete)),
            onPressed: (context) {
              final controller = Slidable.of(context);
              controller!.dismiss(
                ResizeRequest(const Duration(milliseconds: 50), () {
                  if (onDismissed != null) onDismissed!();
                }),
                duration: const Duration(milliseconds: 50),
                curve: Curves.easeIn,
              );
            },
          ),
        ],
      ),
      child: child,
    );
  }
}
