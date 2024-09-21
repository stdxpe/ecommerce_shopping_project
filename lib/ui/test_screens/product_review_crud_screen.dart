import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/models/review.dart';
import 'package:ecommerce_shopping_project/services/firebase_product_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProductReviewCrudScreen extends StatefulWidget {
  const ProductReviewCrudScreen({super.key});

  @override
  State<ProductReviewCrudScreen> createState() =>
      _ProductReviewCrudScreenState();
}

class _ProductReviewCrudScreenState extends State<ProductReviewCrudScreen> {
  List<Review> reviews = [];
  List<String> imageUrls = [];

  getImageUrls() async {
    final _storage = locator<FirebaseStorage>();
    for (var i = 0; i < 12; i++) {
      String fullPath =
          await _storage.ref('/ai-generated-faces/ai$i.png').getDownloadURL();
      imageUrls.add(fullPath);
    }

    imageUrls.shuffle();
    imageUrls.shuffle();
  }

  createReviews({required String productId}) async {
    final faker = Faker.instance;
    imageUrls.shuffle();

    for (var i = 0;
        i < faker.datatype.number(min: 5, max: 12);
        // i < 2;
        i++) {
      String reviewId = const Uuid().v4();

      Review reviewTest = Review(
        // id: const Uuid().v1(),
        id: reviewId,
        // productId: const Uuid().v4(),
        productId: productId,
        senderName: faker.name.fullName(gender: Gender.female),
        senderPhoto: imageUrls[i],
        productRating: faker.datatype.float(min: 0.5, max: 5, precision: 1),
        createdAt: Timestamp.fromDate(
            faker.date.past(DateTime.now(), rangeInYears: 4)),
        text: faker.lorem
            .paragraph(sentenceCount: faker.datatype.number(min: 1, max: 7)),
      );

      print('/////////////////////////////////////////////');
      print(reviewTest.toString());
      print('/////////////////////////////////////////////');

      setState(() {
        reviews.add(reviewTest);
      });

      // /2d1ed2b1-71ec-11ef-bf32-016e75c729f2
      // /2d1ed2b0-71ec-11ef-bf32-016e75c729f2
      // /2d1eaba2-71ec-11ef-bf32-016e75c729f2
      // _db.doc('products/00000').collection('reviews')
      //                 .add(data)
      // for (var i = 0; i < reviews.length; i++) {
      final _db = locator<FirebaseFirestore>();

      print('ADDED INTO products/$productId/reviews/$reviewId');

      await _db
          .doc('products/$productId/reviews/$reviewId')
          .set(reviews[i].toMap());
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.withOpacity(0.5),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Constants.kMainPaddingHorizontal.w),
        child: ListView(
          children: [
            // VerticalListviewReviewCard(
            //   reviewsList: reviews,
            //   paddingMain: 0,
            //   paddingBetweenElements:
            //       Constants.kMainSpacingBTWCardsVertical * 2.h,
            // ),
            SizedBox(height: 50.h),
            ButtonMain(
              text: 'Create Reviews',
              onPressed: () async {
                // await getImageUrls();

                // final _productService = locator<IProductService>();
                // final _db = locator<FirebaseFirestore>();

                /// DANGEROUS PART
                FirebaseProductService productService =
                    FirebaseProductService();

                // List<Product> allProducts =
                //     await _productService.getAllProducts();

                var allProducts = [];

                for (var i = 0; i < allProducts.length; i++) {
                  print('------ $i :  ${allProducts[i].id}');
                }

                for (var i = 0; i < allProducts.length; i++) {
                  String productId = allProducts[i].id;
                  Product tempProduct = allProducts[i];

                  // // // // for (var i = 0; i < allProducts.length; i++) {
                  // // // //   String tempProductId = allProducts[i].id;
                  // // // //   reviews.clear();

                  // // // //   await createReviews(productId: tempProductId);
                  // // // // }

//HERE
                  // String productId = '06c8e101-4bed-4ae0-aa8f-0cdf3ecfcc86';

                  // Product? tempProduct =
                  //     await _productService.getProductById(productId: productId);

                  List<Review> reviewsList = await productService
                      .getProductReviews(productId: productId);

                  int newReviewCount = reviewsList.length;

                  double sumTotalRating = 0;

                  for (var review in reviewsList) {
                    sumTotalRating = sumTotalRating + review.productRating;
                  }

                  double newTotalRatingPrecision =
                      (sumTotalRating / newReviewCount);
                  double newTotalRating =
                      double.parse(newTotalRatingPrecision.toStringAsFixed(2));

                  print('reviewCount: $newReviewCount');
                  print('newTotalRatingPrecision: $newTotalRatingPrecision');
                  print('newTotalRating: $newTotalRating');

                  print(tempProduct.toString());

                  int discountPercent = 10;

                  // ProductTest newProduct = ProductTest(
                  //   id: tempProduct.id,
                  //   title: tempProduct.title,
                  //   summary: tempProduct.summary,
                  //   detailedDescription: tempProduct.detailedDescription,
                  //   price: tempProduct.price,
                  //   createdAt: tempProduct.createdAt,
                  //   mainPhoto: tempProduct.mainPhoto,
                  //   photos: tempProduct.photos,
                  //   colors: tempProduct.colors,
                  //   sizes: tempProduct.sizes,
                  //   keywords: tempProduct.keywords,
                  //   totalOrdersCount: tempProduct.totalOrdersCount,
                  //   totalLikesCount: tempProduct.totalLikesCount,
                  //   totalRating: newTotalRating,
                  //   storeId: tempProduct.storeId,
                  //   storeName: tempProduct.storeName,
                  //   stockCount: tempProduct.stockCount,
                  //   shippingFee: tempProduct.shippingFee,
                  //   estimatedShippingDurationInDays:
                  //       tempProduct.estimatedShippingDurationInDays,
                  //   collections: tempProduct.collections,
                  //   totalReviewsCount: newReviewCount,
                  //   discountPercent: discountPercent,
                  //   brand: 'Fracomina',
                  // );

                  // print('////////////');
                  // print(newProduct.toString());
                  // print('////////////');

                  // await _db.doc('products/$productId').set(newProduct.toMap());
                }
              },
            ),
            SizedBox(height: 50.h),
            ButtonMain(
              text: 'Get Reviews',
              onPressed: () async {
                final _storage = locator<FirebaseStorage>();
                final _db = locator<FirebaseFirestore>();

                var returnedCollectionSnapshot = await _db
                    .collection(
                        'products/06c8e101-4bed-4ae0-aa8f-0cdf3ecfcc86/reviews')
                    .orderBy('createdAt', descending: true)
                    .get();
                var returnedList = returnedCollectionSnapshot.docs;

                if (returnedCollectionSnapshot.docs.isNotEmpty &&
                    returnedList.isNotEmpty) {
                  debugPrint(
                      'FirebaseCollectionService getAllCollections if block exec. List is NOT empty');

                  for (var doc in returnedList) {
                    var returnedMap = doc.data();
                    reviews.add(Review.fromMap(returnedMap));
                  }
                }

                setState(() {});

                // FirebaseProductService extends IProductService {
                //  _db.doc('products/${product.id}').set(product.toMap());
                //  _db.doc('products/06c8e101-4bed-4ae0-aa8f-0cdf3ecfcc86').collection('reviews').doc().set();
                // _db.doc('products/00000/reviews/11111').set({'TestKey2': 'TestValue2'});
                // _db.doc('products')
                // _db
                //     .doc('products/00000/reviews/11111')
                //     .set(reviews[0].toMap());
              },
            ),
            SizedBox(height: 50.h),
            ButtonMain(
                text: 'Capitalize',
                onPressed: () async {
                  String desc =
                      'COMPOSITION COTTON 90% POLYESTER 7% SPANDEX 3% The model is 175 cm tall and wears a Small size';
                  print(desc.capitalize);
                  // final _db = locator<FirebaseFirestore>();
                  // final _productService = locator<IProductService>();

// _productService.g
                  // _db.doc('products/00000').collection('reviews')
                  //                 .add(data)
                  // for (var i = 0; i < reviews.length; i++) {
                  //   _db
                  //       .doc('products/00000/reviews/$reviewId')
                  //       .set(reviews[i].toMap());
                  // }
                }),
          ],
        ),
      ),
    );
  }
}
