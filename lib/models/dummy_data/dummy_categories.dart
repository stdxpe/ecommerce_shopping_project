import 'package:ecommerce_shopping_project/models/category.dart';
import 'package:ecommerce_shopping_project/models/dummy_data/dummy_products.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

final List<Category> dummyCategories = [
  Category(
    id: '0000',
    title: 'Women\s Top',
    subtitle: 'Most fashionate top wear',
    photo: AppImages.productImage5,
    products: [
      dummyProducts[0],
    ],
  ),
  Category(
    id: '0000',
    title: 'Underwear',
    subtitle: 'Modern Signature',
    photo: AppImages.productImage10,
    products: [
      dummyProducts[0],
    ],
  ),
];
