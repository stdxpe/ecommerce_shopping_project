import 'package:flutter/material.dart';

import 'package:ecommerce_shopping_project/ui/widgets/sliders/details_screen_slider.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

typedef ImageGalleryArgs = ({List<String> imagesList, int index});

class DialogImageGallery extends StatelessWidget {
  const DialogImageGallery({super.key, required this.args});

  final ImageGalleryArgs args;

  @override
  Widget build(BuildContext context) {
    var cardHeight = context.mediaQuery.size.height * 0.85;
    var cardWidth = context.mediaQuery.size.width;

    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: DetailsScreenSlider(
        imagesList: args.imagesList,
        imageHeight: cardHeight,
        initIndex: args.index,
        boxfit: BoxFit.fitHeight,
        zoomedImageGalleryEnabled: false,
        activeDotColor: Colors.amber,
        dotColor: Colors.grey,
      ),
    );
  }
}
