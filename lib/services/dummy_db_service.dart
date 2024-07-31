import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/i_db_service.dart';

class DummyDbService extends IDbService {
  @override
  Future<List<Product>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
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
