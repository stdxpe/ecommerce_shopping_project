import 'package:ecommerce_shopping_project/models/address.dart';
import 'package:ecommerce_shopping_project/models/cart_product_dto.dart';
import 'package:ecommerce_shopping_project/models/credit_card.dart';
import 'package:ecommerce_shopping_project/models/order.dart';

class UserModel {
  final String id;
  final String notificationId;
  final String username;
  final String email;
  final String? phone;
  final String photo;
  final String? birthday;
  final List<String> wishlist;
  final List<CartProductDto> shoppingCart;
  final List<Order> orders;
  final List<Address> addresses;
  final List<CreditCard> creditCards;

  UserModel({
    required this.id,
    required this.notificationId,
    required this.username,
    required this.email,
    required this.phone,
    required this.photo,
    required this.birthday,
    required this.wishlist,
    required this.shoppingCart,
    required this.orders,
    required this.addresses,
    required this.creditCards,
  });
}
