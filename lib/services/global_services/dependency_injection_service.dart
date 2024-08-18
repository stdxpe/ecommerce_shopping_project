import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

import 'package:ecommerce_shopping_project/business/dummy_db_manager.dart';
import 'package:ecommerce_shopping_project/business/firebase_user_manager.dart';
import 'package:ecommerce_shopping_project/business/i_db_repository.dart';
import 'package:ecommerce_shopping_project/business/i_user_repository.dart';
import 'package:ecommerce_shopping_project/services/dummy_db_service.dart';
import 'package:ecommerce_shopping_project/services/firebase_auth_service.dart';
import 'package:ecommerce_shopping_project/services/firebase_product_service.dart';
import 'package:ecommerce_shopping_project/services/firebase_user_service.dart';
import 'package:ecommerce_shopping_project/services/i_auth_service.dart';
import 'package:ecommerce_shopping_project/services/i_db_service.dart';
import 'package:ecommerce_shopping_project/services/i_product_service.dart';
import 'package:ecommerce_shopping_project/services/i_user_service.dart';

final locator = GetIt.instance;

void registerDependencyInjectionService() {
  /// Database Services (Data Access Layer)
  locator.registerLazySingleton<IDbService>(() => DummyDbService());

  /// Auth Service (Data Access Layer)
  locator.registerLazySingleton<IAuthService>(() => FirebaseAuthService());

  /// User Service (Data Access Layer)
  locator.registerLazySingleton<IUserService>(() => FirebaseUserService());

  /// Product Service (Data Access Layer)
  locator
      .registerLazySingleton<IProductService>(() => FirebaseProductService());

  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  /// Database Managers (Business Layer)
  locator.registerLazySingleton<IDBRepository>(() => DummyDbManager());

  /// User Manager (Business Layer)
  locator.registerLazySingleton<IUserRepository>(() => FirebaseUserManager());

  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  /// FIREBASE INSTANCES

  /// Firebase Auth Service Instance
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  /// Firebase Database Service Instance
  locator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);

  /// Firebase Storage Service Instance
  locator
      .registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);

  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
}
