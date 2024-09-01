import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardImage extends StatelessWidget {
  const CardImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
    this.useFadeInAnimation = true,
  });
  final String imageUrl;
  final double height;
  final double width;
  final bool? useFadeInAnimation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        fadeInDuration: Duration(milliseconds: useFadeInAnimation! ? 250 : 0),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
