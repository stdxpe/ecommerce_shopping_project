import 'package:ecommerce_shopping_project/models/order_product.dart';
import 'package:ecommerce_shopping_project/models/order_product_dto.dart';
import 'package:ecommerce_shopping_project/services/dummy_data/dummy_all_products.dart';

List<OrderProductDto> dummyShoppingCartOrderProductDtos = [
  OrderProductDto(
    id: 'OrderProductDto01',
    selectedProductId: '000003',
    selectedColor: 'Pink',
    selectedSize: 'XXL',
    itemCount: 3,
  ),
  OrderProductDto(
    id: 'OrderProductDto02',
    selectedProductId: '000005',
    selectedColor: 'Purple',
    selectedSize: 'XS',
    itemCount: 5,
  ),
];

List<OrderProduct> dummyShoppingCartOrderProducts = [
  OrderProduct(
    id: 'OrderProduct01',
    selectedProduct: dummyAllProducts[0],
    selectedColor: 'Pink',
    selectedSize: 'XXL',
    itemCount: 21,
  ),
  OrderProduct(
    id: 'OrderProduct02',
    selectedProduct: dummyAllProducts[1],
    selectedColor: 'Purple',
    selectedSize: 'XS',
    itemCount: 13,
  ),
  OrderProduct(
    id: 'OrderProduct03',
    selectedProduct: dummyAllProducts[2],
    selectedColor: 'Pink',
    selectedSize: 'XXL',
    itemCount: 21,
  ),
  OrderProduct(
    id: 'OrderProduct04',
    selectedProduct: dummyAllProducts[3],
    selectedColor: 'Purple',
    selectedSize: 'XS',
    itemCount: 13,
  ),
];
