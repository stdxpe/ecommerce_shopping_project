import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CardImage extends StatelessWidget {
  const CardImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
    this.useFadeInAnimation = true,
    this.clipBehavior = Clip.none,
    this.decoration,
    this.boxfit = BoxFit.cover,
    this.alignment = Alignment.topCenter,
  });
  final String imageUrl;
  final double height;
  final double width;
  final bool? useFadeInAnimation;
  final Clip? clipBehavior;
  final BoxDecoration? decoration;
  final BoxFit? boxfit;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: clipBehavior!,
      decoration: decoration,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: boxfit,
        alignment: alignment!,
        fadeInDuration: Duration(milliseconds: useFadeInAnimation! ? 250 : 0),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    ).animate().fadeIn(duration: 300.ms);
  }
}
