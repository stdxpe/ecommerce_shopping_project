import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter_slidable/flutter_slidable.dart";

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class DismissibleDeleteWidget extends StatefulWidget {
  const DismissibleDeleteWidget({
    required this.child,
    this.uniqueKey,
    super.key,
    this.dismissibleEnabled = false,
    this.onDismissed,
  });

  final bool? dismissibleEnabled;
  final Widget child;
  final String? uniqueKey;
  final Function()? onDismissed;

  @override
  State<DismissibleDeleteWidget> createState() =>
      _DismissibleDeleteWidgetState();
}

class _DismissibleDeleteWidgetState extends State<DismissibleDeleteWidget> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      direction: Axis.horizontal,
      closeOnScroll: true,
      useTextDirection: true,
      enabled: widget.dismissibleEnabled!,

      /// TODO: UNIQUE KEY TO BE CHANGED with Product ID's.
      // key: ValueKey(uniqueKey),
      key: UniqueKey(),
      endActionPane: ActionPane(
        extentRatio: 0.30,
        motion: const ScrollMotion(),
        dragDismissible: false,
        dismissible: DismissiblePane(
          onDismissed: () {
            setState(() {});
          },
        ),
        children: [
          SlidableAction(
            backgroundColor: ColorPalette.dismissibleBg,
            foregroundColor: ColorPalette.dismissibleFg,
            icon: Icons.delete,
            autoClose: true,
            onPressed: (context) async {
              final controller = Slidable.of(context);
              var dismiss = await showDialog<bool>(
                context: context,
                builder: (context) {
                  /// TODO: Delete alert dialogs to-be-changed with snackbars?
                  return CupertinoAlertDialog(
                    title: const Text('Delete'),
                    content: const Text('Item will be deleted'),
                    actions: <Widget>[
                      CupertinoButton(
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      CupertinoButton(
                        child: const Text('Ok'),
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                  );
                },
              );

              if (dismiss!) {
                controller!.dismiss(
                  ResizeRequest(const Duration(milliseconds: 100), () {
                    /// TODO: Remove from the DB List
                    /// Write the code to really remove the widget from the tree.
                    if (widget.onDismissed != null) widget.onDismissed!();
                  }),
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
                // controller.dispose();
              }
            },
          ),
        ],
      ),
      child: widget.child,
    );
  }
}
