import 'package:ecommerce_shopping_project/models/dummy_data/dummy_products.dart';
import 'package:ecommerce_shopping_project/models/review.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

List<Review> dummyReviews = [
  Review(
    senderName: 'Carly West',
    senderPhoto: AppImages.productImage11,
    product: dummyProducts[0],
    productRating: 4.0,
    createdAt: '12.02.2024',
    text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  Review(
    senderName: 'Johnsson Piker',
    senderPhoto: AppImages.productImage12,
    product: dummyProducts[0],
    productRating: 2.75,
    createdAt: '13.02.2024',
    text: 'Lorem ipsum dolor sit amet',
  ),
  Review(
    senderName: 'Mercy Ourstead',
    senderPhoto: AppImages.productImage12,
    product: dummyProducts[1],
    productRating: 3.75,
    createdAt: '30.03.2024',
    text:
        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  Review(
    senderName: 'Micheal Corlys',
    senderPhoto: AppImages.productImage9,
    product: dummyProducts[1],
    productRating: 2.5,
    createdAt: '12.02.2024',
    text:
        'Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
];
