import 'package:ecommerce_shopping_project/models/address.dart';
import 'package:ecommerce_shopping_project/models/credit_card.dart';

List<Address> dummyAddressesList = [
  Address(
    id: '00000',
    fullName: 'Jane Doe',
    addressTitle: 'Home Address',
    addressText: '21st Greenday Street',
    city: 'New York',
    country: 'United States',
    zipCode: '10021',
  ),
  Address(
    id: '00001',
    fullName: 'Jane Doe',
    addressTitle: 'Work Address',
    addressText: '39th Avenue',
    city: 'Manhattan',
    country: 'United States',
    zipCode: '9021313',
  ),
  Address(
    id: '00003',
    fullName: 'Jane Doe',
    addressTitle: 'Jessica\'s Home',
    addressText: '100th Muse Street',
    city: 'Chicago',
    country: 'United States',
    zipCode: '190993',
  ),
];

// const List<CreditCard> dummyCreditCardsList = [
//   {
//     'cardTitle': 'My American Express',
//     'cardHolder': 'Jane Doe',
//     'cardNumber': '5555 5555 5555 5555',
//     'expDate': '12/23',
//     'cvv': '123',
//   },
//   {
//     'cardTitle': 'My Master Card',
//     'cardHolder': 'David Doe',
//     'cardNumber': '4444 5555 5555 5555',
//     'expDate': '12/23',
//     'cvv': '123',
//   },
// ];
