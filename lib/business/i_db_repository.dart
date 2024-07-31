import 'package:ecommerce_shopping_project/models/product.dart';

abstract class IDBRepository {
  Future<List<Product>> getAllProducts();
  Future<Product> getProductById({required String id});
  Future<List<Product>> getProductsByFilter({required String filter});
}
