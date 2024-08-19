import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/models/filter.dart' as filter;
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/i_product_service.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class ProductCrudTestScreen extends ConsumerWidget {
  const ProductCrudTestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 500),
          ButtonMain(
            text: 'Get Product By Id',
            onPressed: () async {
              final _productService = locator<IProductService>();
              List<String> wishlist = [
                '0c5c9ee5-3ee4-4378-8c81-66bde0b8c604',
                '1d87f3ef-ef95-44d2-a8b9-3e445c47135f',
                '3d11f56d-80b3-4fa8-9404-9305d65e66f2',
                'bfec989b-8be3-410d-8d6b-490af3b39c0d',
                '0c5c9ee5-3ee4-4378-8c81-66bde0b8c604',
                '3d11f56d-80b3-4fa8-9404-9305d65e',
                'bfec989b-8be3-410d-8d6b-490af3b3',
              ];

              var temp = await _productService.getProductsByFilter(
                  filter: filter.Filter(
                id: '123',
                query: 'Rubber'.toLowerCase(),
                // query: 'All',
                // collections: ['Autumn'],
                sizes: ['40'],
                sortBy: AppStrings.filterSortByRating,
                priceMin: 0,
                priceMax: 1000,
              ));

              for (var item in temp) {
                print(
                    // '${item.id}  ||  ${item.title} || ${item.price} || R${item.totalRating} || <3${item.totalLikesCount}');
                    'T: ${DateFormat('dd.MM.yyyy').format(item.createdAt.toDate())} ||R: ${item.totalRating} ||<3: ${item.totalLikesCount} || ${item.id}  ||  ${item.title} || ${item.price}');
              }

              // List temp = [];

              // for (var item in wishlist) {
              //   Product? product =
              //       await _productService.getProductById(productId: item);

              //   if (product != null) {
              //     temp.add(product.id);
              //     await _productService.updateProduct(
              //         product: product.copyWith(brand: 'All Brands Updated'));
              //     // print('product : ${product.id}');
              //     // print(product.toString());
              //   }
              // }

              // temp.forEach(print);

              // await _productService.deleteProduct(
              //     productId: '0c5c9ee5-3ee4-4378-8c81-66bde0b8c604');

              // print('products : ${product.id}');

              // await _productService.updateProduct(
              //     product: product!.copyWith(
              //         title: 'Updated Product Title',
              //         summary: 'Updated Product Summary'));

              // await _productService.deleteProduct(
              //   productId: 'e4f8ca07-30c4-4f48-af2d-b5a425a7f4cb',
              // );
            },
          ),
        ],
      ),
    );
  }
}
