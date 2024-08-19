import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_product_service.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class FirebaseProductService extends IProductService {
  final _db = locator<FirebaseFirestore>();

  @override
  Future<Product?> getProductById(
      {required String productId, required String sourcePath}) async {
    var returnedSnapshot = await _db.doc('$sourcePath/$productId').get();
    var returnedMap = returnedSnapshot.data();

    if (returnedSnapshot.exists &&
        returnedMap != null &&
        returnedMap.isNotEmpty) {
      Product product = Product.fromMap(returnedMap);

      print(
          'FirebaseProductService getProductById if block exec. Product is NOT null');

      return product;
    } else {
      print(
          'FirebaseProductService getProductById else block exec. Product is null');
      return null;
    }
  }

  @override
  Future<void> createProduct(
      {required Product product, required String sourcePath}) async {
    print('FirebaseProductService createProduct exec');
    _db.doc('$sourcePath/${product.id}').set(product.toMap());
    // _db.collection('products').add(product.toMap());
  }

  @override
  Future<void> updateProduct(
      {required Product product, required String sourcePath}) async {
    print('FirebaseProductService updateProduct exec');
    _db.doc('$sourcePath/${product.id}').update(product.toMap());
  }

  @override
  Future<void> deleteProduct(
      {required String productId, required String sourcePath}) async {
    _db.doc('$sourcePath/$productId').delete();
  }

  @override
  Future<List<Product>> getProductsByFilter(
      {required filter,
      int maxResultCount = 20,
      required String sourcePath}) async {
    var collectionRef = _db
        .collection(sourcePath)
        .where('price', isGreaterThan: filter.priceMin)
        .where('price', isLessThan: filter.priceMax)
        .where("keywords", arrayContainsAny: [...filter.query!.split(' ')]);

    if (filter.sortBy == AppStrings.filterSortByPopular) {
      collectionRef =
          collectionRef.orderBy('totalLikesCount', descending: true);
    } else if (filter.sortBy == AppStrings.filterSortByRating) {
      collectionRef = collectionRef.orderBy('totalRating', descending: true);
    } else if (filter.sortBy == AppStrings.filterSortByNewest) {
      collectionRef = collectionRef.orderBy('createdAt', descending: true);
    } else if (filter.sortBy == AppStrings.filterSortByPriceHigh) {
      collectionRef = collectionRef.orderBy('price', descending: true);
    } else if (filter.sortBy == AppStrings.filterSortByPriceLow) {
      collectionRef = collectionRef.orderBy('price', descending: false);
    }

    var returnedSnapshot = await collectionRef.limit(maxResultCount).get();

    List<Product> tempList = [];
    var returnedList = returnedSnapshot.docs;

    if (returnedSnapshot.docs.isNotEmpty && returnedList.isNotEmpty) {
      print(
          'FirebaseProductService getProductsByFilter if block exec. List is NOT empty');

      for (var doc in returnedList) {
        var returnedMap = doc.data();
        tempList.add(Product.fromMap(returnedMap));
      }
    } else {
      print(
          'FirebaseProductService getProductsByFilter else block exec. List is empty');
    }
    return tempList;
  }
}

  // onPressed: () async {
            //   final faker = Faker.instance;

            //   var randomId = const Uuid().v4();
            //   // print(randomId);

            //   String randomProduct = faker.commerce.productName();

            //   String randomName = faker.name.fullName();
            //   String randomProductName = faker.commerce.productAdjective();
            //   String randomDesc = faker.commerce.productDescription();
            //   String randomLoremSummary = faker.lorem.sentence();
            //   String randomLoremDetailedDesc = faker.lorem.text();
            //   String randomLoremShortDesc = faker.lorem.paragraph();
            //   String randomLoremWord1 = faker.lorem.word();
            //   String randomLoremWord2 = faker.lorem.word();
            //   String randomPrice =
            //       faker.commerce.price(symbol: '', min: 10, max: 1000);
            //   String randomCompany = faker.company.companyName();
            //   String randomHex1 = faker.datatype.hexaDecimal(length: 6);
            //   String randomHex2 = faker.datatype.hexaDecimal(length: 6);
            //   String randomHex3 = faker.datatype.hexaDecimal(length: 6);
            //   String random = faker.commerce.productDescription();
            //   String randomImage = faker.image.loremPicsum.image();

            //   var randomDate = faker.date.past(DateTime.now());

            //   // faker.image
            //   String randomSize1 =
            //       faker.datatype.number(min: 1, max: 50).toString();
            //   String randomSize2 =
            //       faker.datatype.number(min: 1, max: 50).toString();

            //   print(randomHex1);
            //   print('random: $random');
            //   print('randomImage: $randomImage');

            //   print('randomDate: $randomDate');

            //   print(randomName);
            //   print(randomProductName);
            //   print(randomDesc);
            //   print(randomPrice);
            //   print('randomCompany: $randomCompany');

            //   print('randomLoremWord: $randomLoremWord1 $randomLoremWord2 ');
            //   print('randomLoremSummary: $randomLoremSummary');
            //   print('randomLoremShortDesc: $randomLoremShortDesc');
            //   print('randomLoremDetailedDesc: $randomLoremDetailedDesc');

            //   final _productService = locator<IProductService>();

            //   for (var i = 0; i < 50; i++) {
            //     String generatedTitle =
            //         '${faker.name.fullName()} ${faker.commerce.productName()}';
            //     String generatedBrand =
            //         '${faker.lorem.word()} ${faker.lorem.word()}';

            //     List<String> keywords = [
            //       'All',
            //       ...generatedTitle.toLowerCase().split(' '),
            //       ...generatedBrand.toLowerCase().split(' ')
            //     ];

            //     var createdAt = Timestamp.fromDate(
            //         faker.date.past(DateTime.now(), rangeInYears: 5));

            //     await _productService.createProduct(
            //         product: Product(
            //       id: const Uuid().v4(),
            //       title: generatedTitle,
            //       // '${faker.name.fullName()} ${faker.commerce.productName()}',
            //       summary: faker.lorem.sentence(),
            //       detailedDescription: faker.lorem.text(),
            //       price: double.parse(
            //           faker.commerce.price(symbol: '', min: 10, max: 1000)),
            //       createdAt: createdAt,
            //       mainPhoto: faker.image.loremPicsum.image(),
            //       photos: List.generate(faker.datatype.number(min: 1, max: 6),
            //           (index) => faker.image.loremPicsum.image()),
            //       colors: List.generate(faker.datatype.number(min: 3, max: 10),
            //           (index) => faker.datatype.hexaDecimal(length: 6)),
            //       sizes: List.generate(
            //           faker.datatype.number(min: 4, max: 7),
            //           (index) =>
            //               faker.datatype.number(min: 1, max: 50).toString()),
            //       keywords: keywords,
            //       totalOrdersCount: faker.datatype.number(min: 0, max: 500),
            //       totalLikesCount: faker.datatype.number(min: 0, max: 1000),
            //       totalRating:
            //           faker.datatype.float(min: 0, max: 5, precision: 2),
            //       storeId: const Uuid().v1(),
            //       storeName: faker.company.companyName(),
            //       stockCount: faker.datatype.number(min: 0, max: 500),
            //       shippingFee: double.parse(
            //           faker.commerce.price(symbol: '', min: 0, max: 15)),
            //       estimatedShippingDurationInDays:
            //           faker.datatype.number(min: 0, max: 5),
            //       brand: generatedBrand,
            //       collections: [],
            //       reviews: [],
            //     ));
            //   }
            // },