import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomNavBarBranchAnimation extends StatelessWidget {
  const CustomNavBarBranchAnimation(
      {super.key, required this.currentIndex, required this.children});

  final int currentIndex;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: children.mapIndexed(
        (int index, Widget navigator) {
          return AnimatedSlide(
            offset: currentIndex == index
                ? const Offset(0, 0)
                : index > currentIndex
                    ? const Offset(1, 0)
                    : const Offset(-1, 0),
            duration: 200.ms,
            curve: Curves.easeIn,
            child: _branchNavigatorWrapper(index, navigator),
          );
        },
      ).toList(),
    );
  }

  /// Default method of go_router package for branch transition animations
  Widget _branchNavigatorWrapper(int index, Widget navigator) => IgnorePointer(
        ignoring: index != currentIndex,
        child: TickerMode(
          enabled: index == currentIndex,
          child: navigator,
        ),
      );
}
