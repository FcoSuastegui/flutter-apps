part of 'cart_cubit.dart';

class CartState {
  CartState({
    this.total = 0,
    this.subTotal = 0,
    this.cartItemCount = const [],
    this.product,
    this.selectedColor = 0,
    this.selectedSize = 1,
  });

  final ProductModel? product;
  final double total;
  final double subTotal;
  final List<int> cartItemCount;

  final int selectedColor;
  final int selectedSize;

  CartState copyWith({
    double? total,
    double? subTotal,
    List<int>? cartItemCount,
    ProductModel? product,
    int? selectedColor,
    int? selectedSize,
  }) =>
      CartState(
        total: total ?? this.total,
        subTotal: subTotal ?? this.subTotal,
        cartItemCount: cartItemCount ?? this.cartItemCount,
        product: product ?? this.product,
        selectedColor: selectedColor ?? this.selectedColor,
        selectedSize: selectedSize ?? this.selectedSize,
      );
}
