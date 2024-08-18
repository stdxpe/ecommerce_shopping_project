import 'package:ecommerce_shopping_project/models/collection.dart';

import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

Collection dummyCollection1 = Collection(
  id: '0000',
  title: 'Autumn Collection',
  subtitle: 'Catch the most fashionate trends of this autumn!',
  photo: AppImages.productImage10,
  products: [
    // ...dummyAllProducts,
  ],
);

List<Collection> dummyCollections = [
  Collection(
    id: '0000',
    title: 'Autumn Collection',
    subtitle: 'Catch the most fashionate trends of this autumn!',
    photo: AppImages.productImage10,
    products: [
      // dummyProducts[0],
      // ...dummyAllProducts,
    ],
  ),
  Collection(
    id: '0000',
    title: 'Designer\'s Collection',
    subtitle: 'Awarded Designers of Paris Fashion Week \'24',
    photo: AppImages.productImage11,
    products: [
      // ...dummyAllProducts,
    ],
  ),
  Collection(
    id: '0000',
    title: 'Spring Collection',
    subtitle: 'Up to 20% Off',
    photo: AppImages.productImage13,
    products: [
      // ...dummyAllProducts,
    ],
  ),
];
