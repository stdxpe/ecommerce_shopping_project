import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/models/filter.dart';

abstract class IProductService {
  Future<Product?> getProductById({
    required String productId,
    required String sourcePath,
  });

  Future<void> createProduct({
    required Product product,
    required String sourcePath,
  });

  Future<void> updateProduct({
    required Product product,
    required String sourcePath,
  });

  Future<void> deleteProduct({
    required String productId,
    required String sourcePath,
  });

  Future<List<Product>> getProductsByFilter({
    required Filter filter,
    required String sourcePath,
  });
}
