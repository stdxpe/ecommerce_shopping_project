import 'package:ecommerce_shopping_project/models/filter.dart';
import 'package:ecommerce_shopping_project/models/product.dart';

abstract class IProductService {
  Future<Product?> getProductById({required String productId});
  Future<void> createProduct({required Product product});
  Future<void> updateProduct({required Product product});
  Future<void> deleteProduct({required String productId});
  Future<List<Product>> getProductsByFilter({required Filter filter});
}
