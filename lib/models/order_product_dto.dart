class OrderProductDto {
  final String id;
  final String selectedProductId;
  final String selectedColor;
  final String selectedSize;
  final int itemCount;

  OrderProductDto({
    required this.id,
    required this.selectedProductId,
    required this.selectedColor,
    required this.selectedSize,
    required this.itemCount,
  });
}
