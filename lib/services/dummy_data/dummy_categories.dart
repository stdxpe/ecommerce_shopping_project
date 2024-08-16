import 'package:ecommerce_shopping_project/models/deprecated/category.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_all_products.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

final List<Category> dummyCategories = [
  Category(
    id: '0000',
    title: 'Women\'s Top',
    subtitle: 'Most fashionate top wear',
    photo: AppImages.productImage5,
    products: [
      dummyAllProducts[0],
    ],
  ),
  Category(
    id: '0000',
    title: 'Underwear',
    subtitle: 'Modern Signature',
    photo: AppImages.productImage10,
    products: [
      dummyAllProducts[0],
    ],
  ),
];
