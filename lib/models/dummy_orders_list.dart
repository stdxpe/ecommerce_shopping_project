import 'package:ecommerce_shopping_project/models/order.dart';
import 'package:ecommerce_shopping_project/models/product.dart';

List<Order> dummyOrdersList = [
  Order(
    orderId: '2364993',
    products: [
      Product(
        title:
            'MOS Sale-Fit Shirt Shirtasdfasdfsdfgsdfg Shirtasdfasdfsdfgsdfg Shirtasdfasdfsdfgsdfg Shirtasdfasdfsdfgsdfg',
        price: 133.99,
        mainPhoto: 'assets/images/pose2.jpg',
      ),
      Product(
        title: 'MOS Sale-Fit Shirt',
        price: 49.99,
        mainPhoto: 'assets/images/pose3.jpg',
      ),
    ],
    totalPrice: 183.99,
    createdAt: '12.07.2024',
  ),
  Order(
    orderId: '4898843',
    products: [
      Product(
        title: 'MOS Sale-Fit Shirt',
        price: 49.99,
        mainPhoto: 'assets/images/pose3.jpg',
      ),
    ],
    totalPrice: 428.99,
    createdAt: '23.07.2024',
  ),
];
