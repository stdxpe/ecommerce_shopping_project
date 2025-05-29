import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import 'package:ecommerce_shopping_project/business/abstract_classes/i_order_repository.dart';
import 'package:ecommerce_shopping_project/models/address.dart';
import 'package:ecommerce_shopping_project/models/cart_product.dart';
import 'package:ecommerce_shopping_project/models/order.dart' as model;
import 'package:ecommerce_shopping_project/models/order_product.dart';
import 'package:ecommerce_shopping_project/models/user_model.dart';
import 'package:ecommerce_shopping_project/services/abstract_classes/i_user_service.dart';
import 'package:ecommerce_shopping_project/services/global_services/dependency_injection_service.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

class OrderManager extends IOrderRepository {
  final _userService = locator<IUserService>();

  @override
  Future<List<model.Order>> getOrders({required UserModel userModel}) async {
    try {
      print('OrderManager getOrders try block exec');
      List<model.Order> tempOrders = [];

      for (var order in userModel.orders) {
        tempOrders.add(order);
      }
      return tempOrders;
    } on Exception catch (_) {
      print('OrderManager getOrders catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print('OrderManager getOrders catch error block exec, rethrowing');
      rethrow;
    }
  }

  @override
  Future<model.Order> createOrder({
    required List<CartProduct> shoppingCartProducts,
    required Address shippingAddress,
    required double totalPrice,
    required UserModel userModel,
  }) async {
    try {
      print('OrderManager createOrder try block exec');

      List<model.Order> tempOrders = userModel.orders;

      List<OrderProduct> tempOrderProductsList = [];

      for (var cartProduct in shoppingCartProducts) {
        OrderProduct tempOrderProduct = OrderProduct(
          id: const Uuid().v4(),
          selectedProductId: cartProduct.selectedProduct.id,
          title: cartProduct.selectedProduct.title,
          photo: cartProduct.selectedProduct.mainPhoto,
          price: cartProduct.selectedProduct.price,
          selectedColor: cartProduct.selectedColor,
          selectedSize: cartProduct.selectedSize,
          itemCount: cartProduct.itemCount,
        );
        tempOrderProductsList.add(tempOrderProduct);
      }

      int tempTotalItemCount = 0;
      for (var item in tempOrderProductsList) {
        tempTotalItemCount = tempTotalItemCount + item.itemCount;
      }

      model.Order newOrder = model.Order(
        id: const Uuid().v1(),
        products: tempOrderProductsList,
        totalPrice: totalPrice,
        shippingAddress: shippingAddress,
        createdAt: Timestamp.now(),
        totalItemCount: tempTotalItemCount,
        status: AppStrings.orderStatusStepReceived,
        statusReceivedDate: Timestamp.now(),
        statusPreparedDate: null,
        statusOnTheWayDate: null,
        statusDeliveredDate: null,
      );

      tempOrders.add(newOrder);

      await _userService.updateUserModel(
          userModel: userModel.copyWith(orders: tempOrders));

      return newOrder;
    } on Exception catch (_) {
      print('OrderManager createOrder catch exception block exec, rethrowing');
      rethrow;
    } on Error catch (_) {
      print('OrderManager createOrder catch error block exec, rethrowing');
      rethrow;
    }
  }
}
