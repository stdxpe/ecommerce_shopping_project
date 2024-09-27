import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import 'package:ecommerce_shopping_project/ui/riverpod_providers/wishlist_providers.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class LottieLikeAnimation extends ConsumerStatefulWidget {
  const LottieLikeAnimation({super.key, required this.isLiked});
  final bool isLiked;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LottieTestScreenState();
}

class _LottieTestScreenState extends ConsumerState<LottieLikeAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: 1000.ms);
    _controller.value = widget.isLiked ? 0.5 : 0.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant LottieLikeAnimation oldWidget) {
    _controller.value = oldWidget.isLiked ? 0.5 : 0.0;
    _controller.animateTo(oldWidget.isLiked ? 1 : 0.5, duration: 1000.ms);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    bool visible = ref.watch(wishlistAnimationVisibility);

    return Container(
      height: context.mediaQuery.size.height,
      width: context.mediaQuery.size.width,
      color: visible ? Colors.transparent : null,
      child: (visible)
          ? Center(
              child: Lottie.asset(
                AppImages.lottieLike,
                controller: _controller,
                height: context.mediaQuery.size.width,
                width: context.mediaQuery.size.width,
                fit: BoxFit.fill,
                frameRate: const FrameRate(60),
              ),
            ).animate().fadeOut(duration: 250.ms, delay: 750.ms)
          : const SizedBox(),
    );
  }
}
