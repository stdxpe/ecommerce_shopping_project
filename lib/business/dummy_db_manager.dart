import 'package:ecommerce_shopping_project/business/i_db_repository.dart';
import 'package:ecommerce_shopping_project/models/product.dart';

class DummyDbManager extends IDBRepository {
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
