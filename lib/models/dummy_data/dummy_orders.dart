import 'package:ecommerce_shopping_project/models/dummy_data/dummy_products.dart';
import 'package:ecommerce_shopping_project/models/order.dart';

List<Order> dummyOrders = [
  Order(
    orderId: '2364993',
    products: [
      dummyProducts[0],
      dummyProducts[1],
    ],
    totalPrice: 183.99,
    createdAt: '12.07.2024',
  ),
  Order(
    orderId: '4898843',
    products: [
      dummyProducts[0],
    ],
    totalPrice: 428.99,
    createdAt: '23.07.2024',
  ),
];
