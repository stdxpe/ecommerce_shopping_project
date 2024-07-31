import 'package:ecommerce_shopping_project/services/dummy_db_service.dart';
import 'package:ecommerce_shopping_project/services/i_db_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void locatorGetItSetup() {
  /// Database Services (Data Access Layer)
  locator.registerLazySingleton<IDbService>(() => DummyDbService());
}
