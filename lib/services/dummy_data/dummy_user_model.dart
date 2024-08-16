import 'package:ecommerce_shopping_project/models/address.dart';
import 'package:ecommerce_shopping_project/models/cart_product_dto.dart';
import 'package:ecommerce_shopping_project/models/credit_card.dart';
import 'package:ecommerce_shopping_project/models/user_model.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';

UserModel dummyUserModel = UserModel(
  id: '000XX1',
  notificationId: '000YY1',
  username: 'Jane Doe',
  email: 'verified@gmail.com',
  phone: '555 4443322',
  photo: AppImages.productImage10,
  birthday: '01.02.2024',
  wishlist: ['000001', '000002'],
  shoppingCart: [
    CartProductDto(
      id: 'CartProductDto01',
      selectedProductId: '000003',
      selectedColor: 'Pink',
      selectedSize: 'XXL',
      itemCount: 3,
    ),
    CartProductDto(
      id: 'CartProductDto02',
      selectedProductId: '000005',
      selectedColor: 'Purple',
      selectedSize: 'XS',
      itemCount: 5,
    ),
  ],
  orders: [],
  addresses: [
    Address(
      id: 'sdfgsd',
      addressTitle: 'Home Address',
      addressText: '21st Greenday Street',
      city: 'New York',
      country: 'United States',
      zipCode: 10021,
    ),
    Address(
      id: 'sdfgsd',
      addressTitle: 'Work Address',
      addressText: '39th Avenue',
      city: 'Manhattan',
      country: 'United States',
      zipCode: 9021,
    ),
    Address(
      id: 'sdfgsd',
      addressTitle: 'Jane\'s Home',
      addressText: '100th Muse Street',
      city: 'Chicago',
      country: 'United States',
      zipCode: 190993,
    ),
  ],
  creditCards: [
    CreditCard(
      id: 'sdfgsd',
      cardTitle: 'My American Express',
      cardHolder: 'Jane Doe',
      cardNumber: '5555 5555 4444 3333',
      validThru: '02/28',
      cvv: '134',
    ),
    CreditCard(
      id: 'sdfgsd',
      cardTitle: 'My Master Card',
      cardHolder: 'Jane Doe',
      cardNumber: '3232 5555 1312 3333',
      validThru: '19/29',
      cvv: '713',
    ),
  ],
);
