import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_shopping_project/models/cart_product.dart';
import 'package:ecommerce_shopping_project/models/order_product.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/collections_provider.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/shopping_cart_providers.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/listview_product_card_horizontal_detailed.dart';
import 'package:ecommerce_shopping_project/ui/widgets/listviews_and_gridviews/listview_product_card_vertical.dart';

class UiCardsTestScreen extends ConsumerWidget {
  const UiCardsTestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    OrderProduct orderProduct = OrderProduct(
      id: 'f8307b6f-752c-4b7d-ab9a-2dce1deb63d7',
      selectedProductId: '7eed3502-0d9b-4dcb-98bf-39022d557111',
      title: 'T-shirt Regular Fit Made In Cotton Jersey With Lettering Print',
      photo:
          'https://firebasestorage.googleapis.com/v0/b/ecommerce-shopping-project.appspot.com/o/products%2F765e1b8e-e69f-4724-babb-c243022073e9%2Fcover.jpg?alt=media&token=126b18ae-847a-4c58-95f3-1fdef711264f',
      price: 439.99,
      selectedColor: 'e8B0dB',
      selectedSize: 'XL',
      itemCount: 1,
    );

    CartProduct cartProduct = CartProduct(
      id: 'f8307b6f-752c-4b7d-ab9a-2dce1deb63d7',
      selectedProduct: Product(
          id: 'id',
          title:
              'T-shirt Regular Fit Made In Cotton Jersey With Lettering Print',
          summary: 'summary',
          detailedDescription: 'detailedDescription',
          price: 123.99,
          createdAt: Timestamp.now(),
          mainPhoto:
              'https://firebasestorage.googleapis.com/v0/b/ecommerce-shopping-project.appspot.com/o/products%2F765e1b8e-e69f-4724-babb-c243022073e9%2Fcover.jpg?alt=media&token=126b18ae-847a-4c58-95f3-1fdef711264f',
          photos: [],
          colors: [],
          sizes: [],
          keywords: [],
          totalOrdersCount: 123,
          totalLikesCount: 123,
          totalRating: 3.44,
          storeId: 'storeId',
          storeName: 'storeName',
          stockCount: 23,
          shippingFee: 2,
          estimatedShippingDurationInDays: 2,
          collections: [],
          reviews: []),
      selectedColor: 'e8B0dB',
      selectedSize: 'XL',
      itemCount: 1,
    );

    Product product = Product(
        id: 'id',
        title: 'T-shirt Regular Fit Made In Cotton Jersey With Lettering Print',
        summary: 'summary',
        detailedDescription: 'detailedDescription',
        price: 123.99,
        createdAt: Timestamp.now(),
        mainPhoto:
            'https://firebasestorage.googleapis.com/v0/b/ecommerce-shopping-project.appspot.com/o/products%2F765e1b8e-e69f-4724-babb-c243022073e9%2Fcover.jpg?alt=media&token=126b18ae-847a-4c58-95f3-1fdef711264f',
        photos: [],
        colors: [],
        sizes: [],
        keywords: [],
        totalOrdersCount: 123,
        totalLikesCount: 123,
        totalRating: 3.44,
        storeId: 'storeId',
        storeName: 'storeName',
        stockCount: 23,
        shippingFee: 2,
        estimatedShippingDurationInDays: 2,
        collections: [],
        reviews: []);

    return Scaffold(
      // backgroundColor: Colors.red,
      body: SafeArea(
        child: ListView(
          children: [
            ListviewProductCardVertical(
              provider: collectionsProvider,
              collection: Collections.winter,
            ),
            const SizedBox(height: 40),

            ListviewProductCardHorizontalDetailed(
              provider: shoppingCartProvider,
              cardHeight: 400,
              dismissibleEnabled: true,
            ),

            // TestProductCardHorizontalDetailed(
            //   cartProduct: cartProduct,
            //   card: ref.watch(
            //       horizontalDetailedCard((cardHeight: 300, ctx: context))),

            const SizedBox(height: 40),

            // TestListviewOrderProductCardHorizontalDetailed(
            //   provider: collectionsProvider,
            //   collection: Collections.winter,
            // ),
            // const SizedBox(height: 40),
            // ListviewProductCardHorizontalMini(
            //   provider: collectionsProvider,
            //   collection: Collections.winter,
            // ),
            const SizedBox(height: 40),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     CardPlaceholderVertical(
            //         card: ref
            //             .watch(verticalCard((cardWidth: 300, ctx: context)))),
            //     CardPlaceholderHorizontal(
            //         card: ref.watch(horizontalCard(
            //             (cardWidth: 800, cardHeight: 300, ctx: context)))),
            //   ],
            // ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
