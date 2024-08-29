import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_collection_repository.dart';
import 'package:ecommerce_shopping_project/business/abstract_classes/i_order_repository.dart';
import 'package:ecommerce_shopping_project/business/abstract_classes/i_profile_repository.dart';
import 'package:ecommerce_shopping_project/business/abstract_classes/i_shopping_cart_repository.dart';
import 'package:ecommerce_shopping_project/business/abstract_classes/i_user_repository.dart';
import 'package:ecommerce_shopping_project/business/abstract_classes/i_wishlist_repository.dart';
import 'package:ecommerce_shopping_project/business/collection_manager.dart';
import 'package:ecommerce_shopping_project/business/dummy_db_manager.dart';
import 'package:ecommerce_shopping_project/business/firebase_user_manager.dart';
import 'package:ecommerce_shopping_project/business/i_db_repository.dart';
import 'package:ecommerce_shopping_project/business/order_manager.dart';
import 'package:ecommerce_shopping_project/business/profile_manager.dart';
import 'package:ecommerce_shopping_project/business/shopping_cart_manager.dart';
import 'package:ecommerce_shopping_project/business/wishlist_manager.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_auth_service.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_collection_service.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_product_service.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_storage_service.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_user_service.dart';
import 'package:ecommerce_shopping_project/services/dummy_db_service.dart';
import 'package:ecommerce_shopping_project/services/firebase_auth_service.dart';
import 'package:ecommerce_shopping_project/services/firebase_collection_service.dart';
import 'package:ecommerce_shopping_project/services/firebase_product_service.dart';
import 'package:ecommerce_shopping_project/services/firebase_storage_service.dart';
import 'package:ecommerce_shopping_project/services/firebase_user_service.dart';
import 'package:ecommerce_shopping_project/services/i_db_service_dummy.dart';

final locator = GetIt.instance;

void registerDependencyInjectionService() {
  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  /// Database Services (Data Access Layer)
  locator.registerLazySingleton<IDbServiceDummy>(() => DummyDbService());

  /// Auth Service (Data Access Layer)
  locator.registerLazySingleton<IAuthService>(() => FirebaseAuthService());

  /// User Service (Data Access Layer)
  locator.registerLazySingleton<IUserService>(() => FirebaseUserService());

  /// Product Service (Data Access Layer)
  locator
      .registerLazySingleton<IProductService>(() => FirebaseProductService());

  /// Collection Service (Data Access Layer)
  locator.registerLazySingleton<ICollectionService>(
      () => FirebaseCollectionService());

  /// Storage Service (Data Access Layer)
  locator
      .registerLazySingleton<IStorageService>(() => FirebaseStorageService());

  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  /// Database Managers (Business Layer)
  locator.registerLazySingleton<IDBRepository>(() => DummyDbManager());

  /// User Manager (Business Layer)
  locator.registerLazySingleton<IUserRepository>(() => FirebaseUserManager());

  /// Wishlist Manager (Business Layer)
  locator.registerLazySingleton<IWishlistRepository>(() => WishlistManager());

  /// Shopping Cart Manager (Business Layer)
  locator.registerLazySingleton<IShoppingCartRepository>(
      () => ShoppingCartManager());

  /// Order Manager (Business Layer)
  locator.registerLazySingleton<IOrderRepository>(() => OrderManager());

  /// Profile Manager (Business Layer)
  locator.registerLazySingleton<IProfileRepository>(() => ProfileManager());

  /// Collection Manager (Business Layer)
  locator
      .registerLazySingleton<ICollectionRepository>(() => CollectionManager());

  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

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
