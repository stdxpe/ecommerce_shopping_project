import 'dart:async';

import 'package:ecommerce_shopping_project/models/address.dart';
import 'package:ecommerce_shopping_project/models/cart_product.dart';
import 'package:ecommerce_shopping_project/models/order.dart';
import 'package:ecommerce_shopping_project/models/user_model.dart';

abstract class IOrderRepository {
  Future<List<Order>> getOrders({required UserModel userModel});

  Future<Order> createOrder({
    required List<CartProduct> shoppingCartProducts,
    required Address shippingAddress,
    required double totalPrice,
    required UserModel userModel,
  });
}
