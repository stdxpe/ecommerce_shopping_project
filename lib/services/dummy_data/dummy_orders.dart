import 'package:ecommerce_shopping_project/models/order.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_all_products.dart';

List<Order> dummyOrders = [
  Order(
    orderId: '2364993',
    products: [
      dummyAllProducts[0],
      dummyAllProducts[1],
    ],
    totalPrice: 183.99,
    createdAt: '12.07.2024',
  ),
  Order(
    orderId: '4898843',
    products: [
      dummyAllProducts[0],
    ],
    totalPrice: 428.99,
    createdAt: '23.07.2024',
  ),
];
