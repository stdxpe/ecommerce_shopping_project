import 'dart:convert';

import 'package:ecommerce_shopping_project/models/address.dart';
import 'package:ecommerce_shopping_project/models/cart_product_dto.dart';
import 'package:ecommerce_shopping_project/models/credit_card.dart';
import 'package:ecommerce_shopping_project/models/order.dart';

class UserModel {
  final String id;
  final String email;
  final String notificationId;
  final String username;
  final String phone;
  final String photo;
  final String birthday;
  final List<String> wishlist;
  final List<CartProductDto> shoppingCart;
  final List<Order> orders;
  final List<Address> addresses;
  final List<CreditCard> creditCards;

  UserModel({
    required this.id,
    required this.email,
    required this.notificationId,
    required this.username,
    required this.phone,
    required this.photo,
    required this.birthday,
    required this.wishlist,
    required this.shoppingCart,
    required this.orders,
    required this.addresses,
    required this.creditCards,
  });

  UserModel copyWith({
    String? id,
    String? email,
    String? notificationId,
    String? username,
    String? phone,
    String? photo,
    String? birthday,
    List<String>? wishlist,
    List<CartProductDto>? shoppingCart,
    List<Order>? orders,
    List<Address>? addresses,
    List<CreditCard>? creditCards,
  }) =>
      UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        notificationId: notificationId ?? this.notificationId,
        username: username ?? this.username,
        phone: phone ?? this.phone,
        photo: photo ?? this.photo,
        birthday: birthday ?? this.birthday,
        wishlist: wishlist ?? this.wishlist,
        shoppingCart: shoppingCart ?? this.shoppingCart,
        orders: orders ?? this.orders,
        addresses: addresses ?? this.addresses,
        creditCards: creditCards ?? this.creditCards,
      );

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        notificationId: json["notificationId"],
        username: json["username"],
        phone: json["phone"],
        photo: json["photo"],
        birthday: json["birthday"],
        wishlist: List<String>.from(json["wishlist"].map((x) => x)),
        shoppingCart: List<CartProductDto>.from(
            json["shoppingCart"].map((x) => CartProductDto.fromMap(x))),
        orders: List<Order>.from(json["orders"].map((x) => Order.fromMap(x))),
        addresses: List<Address>.from(
            json["addresses"].map((x) => Address.fromMap(x))),
        creditCards: List<CreditCard>.from(
            json["creditCards"].map((x) => CreditCard.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "notificationId": notificationId,
        "username": username,
        "phone": phone,
        "photo": photo,
        "birthday": birthday,
        "wishlist": List<dynamic>.from(wishlist.map((x) => x)),
        "shoppingCart": List<dynamic>.from(shoppingCart.map((x) => x.toMap())),
        "orders": List<dynamic>.from(orders.map((x) => x.toMap())),
        "addresses": List<dynamic>.from(addresses.map((x) => x.toMap())),
        "creditCards": List<dynamic>.from(creditCards.map((x) => x.toMap())),
      };
}

// import 'package:ecommerce_shopping_project/models/new/address.dart';
// import 'package:ecommerce_shopping_project/models/new/cart_product_dto.dart';
// import 'package:ecommerce_shopping_project/models/new/credit_card.dart';
// import 'package:ecommerce_shopping_project/models/new/order.dart';

// class UserModel {
//   final String id;
//   final String email;
//   final String notificationId;
//   final String username;
//   final String? phone;
//   final String photo;
//   final String? birthday;
//   final List<String> wishlist;
//   final List<CartProductDto> shoppingCart;
//   final List<Order> orders;
//   final List<Address> addresses;
//   final List<CreditCard> creditCards;

//   UserModel({
//     required this.id,
//     required this.email,
//     required this.notificationId,
//     required this.username,
//     required this.phone,
//     required this.photo,
//     required this.birthday,
//     required this.wishlist,
//     required this.shoppingCart,
//     required this.orders,
//     required this.addresses,
//     required this.creditCards,
//   });
// }
