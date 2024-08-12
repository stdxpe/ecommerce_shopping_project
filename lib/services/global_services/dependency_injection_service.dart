import 'package:get_it/get_it.dart';

import 'package:ecommerce_shopping_project/business/dummy_db_manager.dart';
import 'package:ecommerce_shopping_project/business/i_db_repository.dart';
import 'package:ecommerce_shopping_project/services/dummy_db_service.dart';
import 'package:ecommerce_shopping_project/services/i_db_service.dart';

final locator = GetIt.instance;

void registerDependencyInjectionService() {
  /// Database Services (Data Access Layer)
  locator.registerLazySingleton<IDbService>(() => DummyDbService());

  /// Database Managers (Business Layer)
  locator.registerLazySingleton<IDBRepository>(() => DummyDbManager());
}
