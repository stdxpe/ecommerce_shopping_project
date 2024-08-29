import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardImage extends StatelessWidget {
  const CardImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
  });
  final String imageUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        fadeInDuration: const Duration(milliseconds: 250),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
