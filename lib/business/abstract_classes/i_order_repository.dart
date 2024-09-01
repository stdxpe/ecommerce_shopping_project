import 'package:ecommerce_shopping_project/models/order.dart';
import 'package:ecommerce_shopping_project/models/order_product.dart';
import 'package:ecommerce_shopping_project/models/user_model.dart';

abstract class IOrderRepository {
  Future<List<Order>> getOrders({required UserModel userModel});

  Future<void> createOrder(
      {required List<OrderProduct> products, required UserModel userModel});

  /// TODO: Problematic?
  // Future<OrderProduct> createOrderProduct({
  //   required Product product,
  //   required String selectedColor,
  //   required String selectedSize,
  //   required int itemCount,
  // });
}
