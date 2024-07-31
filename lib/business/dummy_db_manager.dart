import 'package:ecommerce_shopping_project/business/i_db_repository.dart';
import 'package:ecommerce_shopping_project/models/product.dart';
import 'package:ecommerce_shopping_project/services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/services/i_db_service.dart';

class DummyDbManager extends IDBRepository {
  var _dbService = locator<IDbService>();

  @override
  Future<List<Product>> getAllProducts() {
    print('DummyDbManager getAllProducts() Executed: "Waiting 2 seconds..."');
    var allProducts = _dbService.getAllProducts();
    return allProducts;
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
