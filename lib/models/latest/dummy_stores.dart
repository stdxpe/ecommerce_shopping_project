import 'package:ecommerce_shopping_project/models/latest/dummy_products.dart';
import 'package:ecommerce_shopping_project/models/store.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

List<Store> dummyStores = [
  Store(
    id: '0000',
    name: 'Louis Vuitton',
    photo: AppImages.blackBg,
    totalRatings: 3.75,
    products: [
      dummyProducts[0],
    ],
    followersCount: 432000,
  ),
  Store(
    id: '0001',
    name: 'Versace',
    photo: AppImages.blackBg,
    totalRatings: 4.75,
    products: [
      dummyProducts[1],
    ],
    followersCount: 29932,
  ),
  Store(
    id: '0002',
    name: 'Zara',
    photo: AppImages.blackBg,
    totalRatings: 3.05,
    products: [
      dummyProducts[2],
    ],
    followersCount: 10932,
  ),
];
