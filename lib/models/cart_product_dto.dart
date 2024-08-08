class CartProductDto {
  final String id;
  final String selectedProductId;
  final String selectedColor;
  final String selectedSize;
  final int itemCount;

  CartProductDto({
    required this.id,
    required this.selectedProductId,
    required this.selectedColor,
    required this.selectedSize,
    required this.itemCount,
  });
}
