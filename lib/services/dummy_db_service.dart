import 'package:ecommerce_shopping_project/models/dummy_data/dummy_products.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/i_db_service.dart';

class DummyDbService extends IDbService {
  @override
  Future<List<Product>> getAllProducts() async {
    print('DummyDbService getAllProducts() Executed: "Waiting 2 seconds...');
    await Future.delayed(const Duration(seconds: 2));
    List<Product> productsList = dummyProducts;

    /// TODO: FromJSON methods here.
    /// dummyProductJsonList.map((e) => Product.fromJson(e)).toList();
    return await Future.value(productsList);
  }

  @override
  Future<Product> getProductById({required String id}) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProductsByFilter({required String filter}) {
    // TODO: implement getProductsByFilter
    throw UnimplementedError();
  }
}
