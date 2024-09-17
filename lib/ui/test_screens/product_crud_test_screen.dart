import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_collection_service.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_product_service.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_user_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/ui/riverpod_providers/collections_provider.dart';
import 'package:ecommerce_shopping_project/ui/widgets/buttons/button_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/titles/title_with_text_button.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class ProductCrudTestScreen extends ConsumerStatefulWidget {
  const ProductCrudTestScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductCrudTestScreenState();
}

class _ProductCrudTestScreenState extends ConsumerState<ProductCrudTestScreen> {
  List<String> fetchedColors = [
    'f1ECFD',
    '1CFccA',
    'D45FcF',
    '9B7A3b',
    '487bF4',
    'ec23eF'
  ];

  List<String> randomColors = [
    'f1ECFD',
    '1CFccA',
    'D45FcF',
    '9B7A3b',
    '487bF4',
    'ec23eF'
  ];

  // List<Product> allProductsList = [];
  List<Product> allProductsList = [];

  // getAllProducts() async {
  //   FirebaseProductService firebaseProductService = FirebaseProductService();
  //   List<Product> tempList = await firebaseProductService.getAllProducts();
  //   tempList.shuffle();
  //   allProductsList = tempList;
  //   // return
  // }

  @override
  void initState() {
    // allProductsList = getAllProducts();
    // getAllProducts();
    // print('allProductsList: $allProductsList');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: ListView(
        children: [
          const SizedBox(height: 50),

          ButtonMain(
            text: 'Update',
            onPressed: () async {
              // List<Collection>? collList = ref.watch(collectionsProvider).value;

              // if (collList != null)
              //   for (var coll in collList) {
              //     // print(coll.toString());
              //     print('URL: ${coll.title} ${coll.photo}');
              //   }

              // // final _storage = locator<FirebaseStorage>();
              // FirebaseProductService firebaseProductService =
              //     FirebaseProductService();

              // List<Product> tempList =
              //     await firebaseProductService.getAllProducts();

              // // print('tempList: ${tempList[0]}');
              // for (var product in tempList) {
              //   // var relativePath = _storage.refFromURL(product.mainPhoto);
              //   // var newTitle = product.title.trim().capitalize;

              //   print('product: ${product.toString()}');
              //   // Product updatedProduct = product.copyWith();

              //   // await firebaseProductService.updateProduct(product: product);
              // }

              // var relativePath = _storage.refFromURL(tempList[0].mainPhoto);
              // print('relativePath: ${relativePath.fullPath}');
              // 'products/06c8e101-4bed-4ae0-aa8f-0cdf3ecfcc86/cover.jpg'

              // var tempString =
              //     'COMPOSITION COTTON 90% POLYESTER 7% SPANDEX 3% The model is 175 cm tall and wears a Small size';
              // var newTitle = tempList[0].title.trim().capitalize;

              // print('newTitle: $newTitle');
              // print('capString: $capString');

              // Product updatedProduct = tempList[0]
              //     .copyWith(title: newTitle, mainPhoto: relativePath.fullPath);
              // print('updatedProduct: ${updatedProduct.toString()}');
            },
          ),

          const SizedBox(height: 50),

          // ref.watch(collectionsProvider).when(
          //       loading: () => Text('Loading'),
          //       error: (error, stackTrace) => Text('Error $error $stackTrace '),
          //       data: (data) =>
          //           // List.generate(data.length, (index) => );
          //           Column(
          //         children: [
          //           ...List.generate(
          //             data.length,
          //             (index) =>
          //                 // ProductCardVertical(
          //                 //   product: data[index].products[0],
          //                 //   cardWidth: context.mediaQuery.size.width,
          //                 // ),
          //                 CollectionCardStack(
          //               collection: data[index],
          //               onPressed: () {},
          //               textColor: Colors.white,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),

          Row(children: [
            ...List<Widget>.generate(fetchedColors.length, (index) {
              return Container(
                height: 50,
                width: 50,
                color: Color(
                    int.parse(fetchedColors[index], radix: 16) + 0xFF000000),
              );
            })
          ]),
          const SizedBox(height: 50),
          Row(children: [
            ...List<Widget>.generate(randomColors.length, (index) {
              return Container(
                height: 50,
                width: 50,
                color: Color(
                    int.parse(randomColors[index], radix: 16) + 0xFF000000),
              );
            })
          ]),

          ref.watch(collectionsProvider).when(
                loading: () => const Text('Loading'),
                error: (error, stackTrace) => Text('Error $error $stackTrace '),
                data: (data) {
                  var list = data[0].products;
                  list.shuffle();
                  return Column(
                    children: [
                      TitleWithTextButton(
                        onPressed: () async {},
                        title: data[0].title,
                        buttonText: AppStrings.collectionTitleRightButton,
                      ),
                      // GridviewProductCardVertical(
                      //   useShimmer: false,
                      //   isCardElevated: false,
                      //   productsList: list,
                      //   itemCountOnRow: 3,
                      //   paddingMain: Constants.kMainPaddingHorizontal,
                      //   paddingBetweenElements:
                      //       Constants.kMainSpacingBTWCardsHorizontal,
                      // ),
                    ],
                  );
                },
              ),
          ref.watch(collectionsProvider).when(
                loading: () => const Text('Loading'),
                error: (error, stackTrace) => Text('Error $error $stackTrace '),
                data: (data) {
                  var list = data[1].products;
                  list.shuffle();
                  return Column(
                    children: [
                      TitleWithTextButton(
                        onPressed: () async {},
                        title: data[1].title,
                        buttonText: AppStrings.collectionTitleRightButton,
                      ),
                      // GridviewProductCardVertical(
                      //   // useShimmer: true,
                      //   isCardElevated: false,
                      //   // productsList: dummyAllProducts,
                      //   // productsList: allProductsList,
                      //   productsList: list,
                      //   // productsList: getAllProducts(),
                      //   itemCountOnRow: 3,
                      //   paddingMain: Constants.kMainPaddingHorizontal,
                      //   paddingBetweenElements:
                      //       Constants.kMainSpacingBTWCardsHorizontal,
                      // ),
                    ],
                  );
                },
              ),
          ref.watch(collectionsProvider).when(
                loading: () => const Text('Loading'),
                error: (error, stackTrace) => Text('Error $error $stackTrace '),
                data: (data) {
                  var list = data[2].products;
                  list.shuffle();
                  return Column(
                    children: [
                      TitleWithTextButton(
                        onPressed: () async {},
                        title: data[2].title,
                        buttonText: AppStrings.collectionTitleRightButton,
                      ),
                      // GridviewProductCardVertical(
                      //   // useShimmer: true,
                      //   isCardElevated: false,
                      //   // productsList: dummyAllProducts,
                      //   // productsList: allProductsList,
                      //   productsList: list,
                      //   // productsList: getAllProducts(),
                      //   itemCountOnRow: 3,
                      //   paddingMain: Constants.kMainPaddingHorizontal,
                      //   paddingBetweenElements:
                      //       Constants.kMainSpacingBTWCardsHorizontal,
                      // ),
                    ],
                  );
                },
              ),
          ref.watch(collectionsProvider).when(
                loading: () => const Text('Loading'),
                error: (error, stackTrace) => Text('Error $error $stackTrace '),
                data: (data) {
                  var list = data[3].products;
                  list.shuffle();
                  return Column(
                    children: [
                      TitleWithTextButton(
                        onPressed: () async {},
                        title: data[3].title,
                        buttonText: AppStrings.collectionTitleRightButton,
                      ),
                      // GridviewProductCardVertical(
                      //   // useShimmer: true,
                      //   isCardElevated: false,
                      //   // productsList: dummyAllProducts,
                      //   // productsList: allProductsList,
                      //   productsList: list,
                      //   // productsList: getAllProducts(),
                      //   itemCountOnRow: 3,
                      //   paddingMain: Constants.kMainPaddingHorizontal,
                      //   paddingBetweenElements:
                      //       Constants.kMainSpacingBTWCardsHorizontal,
                      // ),
                    ],
                  );
                },
              ),
          Visibility(
            visible: false,
            child: ButtonMain(
              text: 'Create Product',
              onPressed: () async {
                // final _productService = locator<IProductService>();
                final collectionService = locator<ICollectionService>();
                final userService = locator<IUserService>();

                final db = locator<FirebaseFirestore>();
                // final _storage = locator<FirebaseStorage>();

                // debugPrint('debugPrint');
                // await fetchImageUrl(
                //     'collections/A33BhxWDPBU1OhBZLkTH/collection_winter.jpg');

                final faker = Faker.instance;

                var randomId = const Uuid().v4();
                // print(randomId);

                String randomProduct = faker.commerce.productName();

                String randomName = faker.name.fullName();
                String randomProductName = faker.commerce.productAdjective();
                String randomDesc = faker.commerce.productDescription();
                String randomLoremSummary = faker.lorem.sentence();
                String randomLoremDetailedDesc = faker.lorem.text();
                String randomLoremShortDesc = faker.lorem.paragraph();
                String randomLoremWord1 = faker.lorem.word();
                String randomLoremWord2 = faker.lorem.word();
                String randomPrice =
                    faker.commerce.price(symbol: '', min: 10, max: 1000);
                String randomCompany = faker.company.companyName();
                String randomHex1 = faker.datatype.hexaDecimal(length: 6);
                String randomHex2 = faker.datatype.hexaDecimal(length: 6);
                String randomHex3 = faker.datatype.hexaDecimal(length: 6);
                String random = faker.commerce.productDescription();
                String randomImage = faker.image.loremPicsum.image();

                var randomDate = faker.date.past(DateTime.now());

                // faker.image
                String randomSize1 =
                    faker.datatype.number(min: 1, max: 50).toString();
                String randomSize2 =
                    faker.datatype.number(min: 1, max: 50).toString();

                print(randomHex1);
                print('random: $random');
                print('randomImage: $randomImage');

                print('randomDate: $randomDate');

                print(randomName);
                print(randomProductName);
                print(randomDesc);
                print(randomPrice);
                print('randomCompany: $randomCompany');

                print('randomLoremWord: $randomLoremWord1 $randomLoremWord2 ');
                print('randomLoremSummary: $randomLoremSummary');
                print('randomLoremShortDesc: $randomLoremShortDesc');
                print('randomLoremDetailedDesc: $randomLoremDetailedDesc');

                final _productService = locator<IProductService>();

                // for (var i = 0; i < 0; i++) {
                String generatedTitle =
                    '${faker.name.fullName()} ${faker.commerce.productName()}';
                String generatedBrand =
                    '${faker.lorem.word()} ${faker.lorem.word()}';

                // List<String> keywords = [
                //   'All',
                //   ...generatedTitle.toLowerCase().split(' '),
                //   ...generatedBrand.toLowerCase().split(' ')
                // ];

                var createdAt = Timestamp.fromDate(
                    faker.date.past(DateTime.now(), rangeInYears: 4));

                var color = faker.datatype.hexaDecimal(length: 6);
                print('Color Hex: ${color}');
                print('Color Hex: ${color.split('x').last}');

                var colors = List.generate(
                    faker.datatype.number(min: 2, max: 5), (index) {
                  var tempColor = faker.datatype.hexaDecimal(length: 6);
                  return tempColor.split('x').last;
                });
                print('colors: $colors');
                setState(() {
                  fetchedColors = colors;
                });

                // var options =
                //     Options(format: Format.hex, colorType: ColorType.green);
                // var colorRandom = RandomColor.getColor(options);

                Options options = Options(
                    format: Format.hex,
                    // alpha: 0.3,
                    alpha: 0.0,
                    luminosity: Luminosity.light,
                    count: faker.datatype.number(min: 3, max: 5),
                    colorType: [ColorType.blue, ColorType.red]);
                List colorRandom = RandomColor.getColor(options);
                List formattedList = colorRandom
                    .map((e) => e.split('#').last.toString())
                    .toList();

                // Helper class for color operations.

                // int hexToInt(String hex);
                // String intToHex(int i);
                // String shadeColor(String hex, int percent);
                // String fillUpHex(String hex);
                ///////////// bool isDark(String hex);
                print('colorRandom: $colorRandom');
                print('formattedList: $formattedList');

                // setState(() {
                //   randomColors = formattedList as List<String>;
                // });

                // print('title : ${title.capitalize}');

                // // // // // Review reviewTest = Review(
                // // // // //   id: const Uuid().v1(),
                // // // // //   productId: const Uuid().v4(),
                // // // // //   senderName: faker.name.fullName(),
                // // // // //   senderPhoto: 'senderPhoto',
                // // // // //   productRating:
                // // // // //       faker.datatype.float(min: 0.5, max: 5, precision: 2),
                // // // // //   createdAt: createdAt,
                // // // // //   text: faker.lorem.paragraph(sentenceCount: 5),
                // // // // //   // faker.lorem.paragraph(
                // // // // //   //     sentenceCount: faker.datatype.number(min: 2, max: 7)),
                // // // // // );

                //       String randomLoremSummary = faker.lorem.sentence();
                // String randomLoremDetailedDesc = faker.lorem.text();
                // String randomLoremShortDesc = faker.lorem.paragraph();

                // print('review: ${reviewTest.toString()}');

                // setState(() {
                //   randomColors.add(colorRandom);
                // });

                // print('Color Hex: ${faker.datatype.hexaDecimal(length: 6)}');
                // await _collectionService.createCollection(
                //     collection: Collection(
                //   // id: const Uuid().v6(),
                //   id: 'sFAOoz4pCItqUJNIVhJL',
                //   title: 'title',
                //   subtitle: 'title',
                //   detailedDescription: 'title',
                //   photo: 'photo',
                //   products: [],
                // ));

                // await _productService.createProduct(
                //     product: Product(

                // // /// TODO: HERE WE GO
                // // String id = const Uuid().v4();

                // // String title = 'Cardigan slim fit with small studs';

                // // String summary =
                // //     'Cardigan slim fit with small studs. Round neck, central buttons for opening and long sleeves';

                // // String detailedDescription =
                // //     'COMPOSITION: VISCOSE 50% POLYESTER 28% NYLON 22%';

                // // List<String> keywords = [
                // //   'All',
                // //   ...title.toLowerCase().split(' '),
                // // ];

                // // Product newlyCreatedproduct = Product(
                // //   // id: const Uuid().v4(),
                // //   id: id,
                // //   title: title,
                // //   summary: summary,
                // //   detailedDescription: detailedDescription,
                // //   brand: 'Fracomina',
                // //   price: double.parse(
                // //       faker.commerce.price(symbol: '', min: 50, max: 1000)),
                // //   createdAt: createdAt,
                // //   mainPhoto: 'products/$id/cover.jpg',
                // //   photos: [
                // //     'products/$id/1.jpg',
                // //     'products/$id/2.jpg',
                // //     'products/$id/3.jpg',
                // //   ],
                // //   colors: colors,
                // //   sizes: ['XS', 'S', 'M', 'L', 'XL'],
                // //   keywords: keywords,
                // //   totalOrdersCount: faker.datatype.number(min: 10, max: 500),
                // //   totalLikesCount: faker.datatype.number(min: 50, max: 1000),
                // //   totalRating:
                // //       faker.datatype.float(min: 0.5, max: 5, precision: 2),
                // //   storeId: const Uuid().v1(),
                // //   storeName: faker.company.companyName(),
                // //   stockCount: faker.datatype.number(min: 0, max: 500),
                // //   shippingFee: double.parse(
                // //       faker.commerce.price(symbol: '', min: 0, max: 15)),
                // //   estimatedShippingDurationInDays:
                // //       faker.datatype.number(min: 0, max: 5),
                // //   collections: [],
                // //   reviews: [],
                // // );
                // // print('newlyCreatedproduct: $newlyCreatedproduct');

                // // await _productService.createProduct(product: newlyCreatedproduct);
                /// TODO: HERE WE END

                // await _productService.createProduct(
                //     product: Product(
                //   id: const Uuid().v4(),
                //   title: generatedTitle,
                //   // '${faker.name.fullName()} ${faker.commerce.productName()}',
                //   summary: faker.lorem.sentence(),
                //   detailedDescription: faker.lorem.text(),
                //   price: double.parse(
                //       faker.commerce.price(symbol: '', min: 10, max: 1000)),
                //   createdAt: createdAt,
                //   mainPhoto: faker.image.loremPicsum.image(),
                //   photos: List.generate(faker.datatype.number(min: 1, max: 6),
                //       (index) => faker.image.loremPicsum.image()),
                //   colors: List.generate(faker.datatype.number(min: 3, max: 10),
                //       (index) => faker.datatype.hexaDecimal(length: 6)),
                //   sizes: List.generate(
                //       faker.datatype.number(min: 4, max: 7),
                //       (index) =>
                //           faker.datatype.number(min: 1, max: 50).toString()),
                //   keywords: keywords,
                //   totalOrdersCount: faker.datatype.number(min: 0, max: 500),
                //   totalLikesCount: faker.datatype.number(min: 0, max: 1000),
                //   totalRating:
                //       faker.datatype.float(min: 0, max: 5, precision: 2),
                //   storeId: const Uuid().v1(),
                //   storeName: faker.company.companyName(),
                //   stockCount: faker.datatype.number(min: 0, max: 500),
                //   shippingFee: double.parse(
                //       faker.commerce.price(symbol: '', min: 0, max: 15)),
                //   estimatedShippingDurationInDays:
                //       faker.datatype.number(min: 0, max: 5),
                //   brand: generatedBrand,
                //   collections: [],
                //   reviews: [],
                // ));
                // }
              },
            ),
          ),
        ],
      ),
    );
  }
}
