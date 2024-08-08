import 'package:ecommerce_shopping_project/models/cart_product.dart';
import 'package:ecommerce_shopping_project/models/cart_product_dto.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_all_products.dart';

List<CartProductDto> dummyShoppingCartOrderProductDtos = [
  CartProductDto(
    id: 'OrderProductDto01',
    selectedProductId: '000003',
    selectedColor: 'Pink',
    selectedSize: 'XXL',
    itemCount: 3,
  ),
  CartProductDto(
    id: 'OrderProductDto02',
    selectedProductId: '000005',
    selectedColor: 'Purple',
    selectedSize: 'XS',
    itemCount: 5,
  ),
];

List<CartProduct> dummyShoppingCartOrderProducts = [
  CartProduct(
    id: 'OrderProduct01',
    selectedProduct: dummyAllProducts[0],
    selectedColor: 'Pink',
    selectedSize: 'XXL',
    itemCount: 21,
  ),
  CartProduct(
    id: 'OrderProduct02',
    selectedProduct: dummyAllProducts[1],
    selectedColor: 'Purple',
    selectedSize: 'XS',
    itemCount: 13,
  ),
  CartProduct(
    id: 'OrderProduct03',
    selectedProduct: dummyAllProducts[2],
    selectedColor: 'Pink',
    selectedSize: 'XXL',
    itemCount: 21,
  ),
  CartProduct(
    id: 'OrderProduct04',
    selectedProduct: dummyAllProducts[3],
    selectedColor: 'Purple',
    selectedSize: 'XS',
    itemCount: 13,
  ),
];
