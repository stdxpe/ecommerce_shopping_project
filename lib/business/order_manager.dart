import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import 'package:ecommerce_shopping_project/models/order.dart' as model;
import 'package:ecommerce_shopping_project/business/abstract_classes/i_order_repository.dart';
import 'package:ecommerce_shopping_project/models/order_product.dart';
import 'package:ecommerce_shopping_project/models/user_model.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_user_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';

class OrderManager extends IOrderRepository {
  final _userService = locator<IUserService>();

  @override
  Future<List<model.Order>> getOrders({required UserModel userModel}) async {
    try {
      print('OrderManager getOrders try block exec');
      return userModel.orders;
    } on Exception catch (_) {
      print('OrderManager getOrders catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print('OrderManager getOrders catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<void> createOrder({
    required List<OrderProduct> products,
    required UserModel userModel,
  }) async {
    try {
      print('OrderManager addOrder try block exec');

      List<model.Order> tempOrders = userModel.orders;
      double totalPrice = 0;
      for (var product in products) {
        totalPrice = totalPrice + product.price;
      }

      tempOrders.add(
        model.Order(
          id: const Uuid().v4(),
          products: products,
          totalPrice: totalPrice,
          createdAt: Timestamp.now(),
        ),
      );

      await _userService.updateUserModel(
          userModel: userModel.copyWith(orders: tempOrders));
    } on Exception catch (_) {
      print('OrderManager addOrder catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print('OrderManager addOrder catch error block exec, rethrowing');
      rethrow;
    }
  }

  /// TODO: Problematic?
  // @override
  // Future<OrderProduct> createOrderProduct(
  //     {required Product product,
  //     required String selectedColor,
  //     required String selectedSize,
  //     required int itemCount}) async {
  //   try {
  //     print('OrderManager createOrderProduct try block exec');
  //     return OrderProduct(
  //       id: const Uuid().v4(),
  //       selectedProductId: product.id,
  //       title: product.title,
  //       photo: product.mainPhoto,
  //       price: product.price,
  //       selectedColor: selectedColor,
  //       selectedSize: selectedSize,
  //       itemCount: itemCount,
  //     );
  //   } on Exception catch (_) {
  //     print(
  //         'OrderManager createOrderProduct catch exception block exec, rethrowing');
  //     rethrow;
  //   } on Error catch (_) {
  //     print(
  //         'OrderManager createOrderProduct catch error block exec, rethrowing');
  //     rethrow;
  //   }
  // }
}
