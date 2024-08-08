class UserModel {
  final String id;
  final String notificationId;
  final String username;
  final String email;
  final String? phone;
  final String photo;
  final String birthday;
  final List<String> wishlist;
  final List<String> shoppingCart;
  final List<String> orders;
  final List<String> addresses;

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
  });
}
