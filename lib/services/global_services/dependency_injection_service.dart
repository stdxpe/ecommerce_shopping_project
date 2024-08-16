import 'package:ecommerce_shopping_project/business/firebase_user_manager.dart';
import 'package:ecommerce_shopping_project/business/i_user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:ecommerce_shopping_project/business/dummy_db_manager.dart';
import 'package:ecommerce_shopping_project/business/i_db_repository.dart';
import 'package:ecommerce_shopping_project/services/dummy_db_service.dart';
import 'package:ecommerce_shopping_project/services/firebase_auth_service.dart';
import 'package:ecommerce_shopping_project/services/i_auth_service.dart';
import 'package:ecommerce_shopping_project/services/i_db_service.dart';

final locator = GetIt.instance;

void registerDependencyInjectionService() {
  /// Database Services (Data Access Layer)
  locator.registerLazySingleton<IDbService>(() => DummyDbService());

  /// Auth Service (Data Access Layer)
  locator.registerLazySingleton<IAuthService>(() => FirebaseAuthService());

  /// Database Managers (Business Layer)
  locator.registerLazySingleton<IDBRepository>(() => DummyDbManager());

  /// User Manager (Business Layer)
  locator.registerLazySingleton<IUserRepository>(() => FirebaseUserManager());

  /////////////// Firebase Instances
  ///
  /// Firebase Auth Service Instance
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  /// Firebase Database Service Instance
  locator.registerSingleton(() => FirebaseFirestore.instance);

  /// Firebase Storage Service Instance
  locator.registerSingleton(() => FirebaseStorage.instance);
}
