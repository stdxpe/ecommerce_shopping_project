import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_shopping_project/models/collection.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class StaggeredGridCardComponentLeft extends StatelessWidget {
  /// REQUIRES AT LEAST 6 ITEMS
  final Collection collection;
  final Function() onPressed;
  final double? cardHeight;
  final double? paddingHorizontal;
  final double? betweenElementsPadding;

  const StaggeredGridCardComponentLeft({
    required this.collection,
    required this.onPressed,
    this.cardHeight,
    this.paddingHorizontal = Constants.kMainPaddingHorizontal,
    this.betweenElementsPadding = Constants.kMainSpacingBTWCardsHorizontal,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = context.mediaQuery.size;
    double width = (size.width - paddingHorizontal!.w * 2);
    double height = cardHeight ?? (size.width * 0.5);
    // double betweenElements = betweenElementsPadding!.h;
    double betweenElements = 10.w;

    double totalWidth = width - (betweenElements * 3);
    double totalHeight = height - (betweenElements);

    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Column(
        children: [
          TitleMain(title: 'Autumn Collection', paddingTop: 77.h),
          Align(
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                // color: Colors.red.withOpacity(0.5),
                color: context.colorPalette.scaffoldBackground,
                borderRadius:
                    BorderRadius.circular(Constants.kRadiusCardSecondary),

                /// Uncomment for BoxShadow
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black54.withOpacity(0.35),
                //     spreadRadius: 0.1,
                //     blurRadius: 10,
                //     offset: const Offset(0, 3.5),
                //   ),
                // ],
              ),
              height: height,
              width: width,
              child: Row(
                children: [
                  Container(
                    height: height,
                    width: totalWidth / 4,
                    color: Colors.green.withOpacity(0.5),
                    child: Image.asset(
                      collection.products[0].mainPhoto,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: betweenElements),
                  Container(
                    height: height,
                    width: totalWidth / 4,
                    color: Colors.yellow.withOpacity(0.5),
                    child: Image.asset(
                      collection.products[1].mainPhoto,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: betweenElements),
                  Column(
                    children: [
                      Container(
                        height: totalHeight / 2,
                        width: totalWidth / 4,
                        color: Colors.purple.withOpacity(0.5),
                        child: Image.asset(
                          collection.products[2].mainPhoto,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: betweenElements),
                      Container(
                        height: totalHeight / 2,
                        width: totalWidth / 4,
                        color: Colors.tealAccent.withOpacity(0.5),
                        child: Image.asset(
                          collection.products[3].mainPhoto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: betweenElements),
                  Column(
                    children: [
                      Container(
                        height: totalHeight / 2,
                        width: totalWidth / 4,
                        color: Colors.amberAccent.withOpacity(0.5),
                        child: Image.asset(
                          collection.products[4].mainPhoto,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: betweenElements),
                      Container(
                        height: totalHeight / 2,
                        width: totalWidth / 4,
                        color: Colors.pink.withOpacity(0.5),
                        child: Image.asset(
                          collection.products[5].mainPhoto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// child: Stack(
//           children: [
//             Align(
//               alignment: Alignment.topLeft,
//               child: Container(
//                 color: Colors.green.withOpacity(0.5),
//                 height: height,
//                 width: width * (1 / 4),
//                 child: Image.asset(
//                   'assets/images/pose1.jpg',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Positioned(
//               left: width * (1 / 4),
//               child: Container(
//                 color: Colors.yellow.withOpacity(0.5),
//                 height: height,
//                 width: width * (1 / 4),
//                 child: Image.asset(
//                   'assets/images/pose0.jpg',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Positioned(
//               left: width * (2 / 4),
//               child: Container(
//                 color: Colors.lightBlue.withOpacity(0.5),
//                 height: height / 2,
//                 width: width / 4,
//                 child: Image.asset(
//                   'assets/images/pose2.jpg',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Positioned(
//               left: width * (2 / 4),
//               bottom: 0,
//               child: Container(
//                 color: Colors.orange.withOpacity(0.5),
//                 height: height / 2,
//                 width: width / 4,
//                 child: Image.asset(
//                   'assets/images/pose3.jpg',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.topRight,
//               child: Container(
//                 color: Colors.purple.withOpacity(0.5),
//                 height: height / 2,
//                 width: width / 4,
//                 child: Image.asset(
//                   'assets/images/pose4.jpg',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomRight,
//               child: Container(
//                 color: Colors.red.withOpacity(0.5),
//                 height: height / 2,
//                 width: width / 4,
//                 child: Image.asset(
//                   'assets/images/pose5.jpg',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ],
//         ),
