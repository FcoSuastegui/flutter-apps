part of 'explore_cubit.dart';

class ExploreState {
  ExploreState({
    this.products = const [],
    this.product,
    this.isScrolled = false,
    this.selectedColor = 0,
    this.selectedSize = 1,
    this.selectedRange = const RangeValues(150.00, 1500.00),
  });

  final List<ProductModel> products;
  final ProductModel? product;
  final bool isScrolled;

  final int selectedColor;
  final int selectedSize;
  final RangeValues selectedRange;

  ExploreState copyWith({
    List<ProductModel>? products,
    ProductModel? product,
    bool? isScrolled,
    int? selectedColor,
    int? selectedSize,
    RangeValues? selectedRange,
  }) =>
      ExploreState(
        products: products ?? this.products,
        product: product ?? this.product,
        isScrolled: isScrolled ?? this.isScrolled,
        selectedColor: selectedColor ?? this.selectedColor,
        selectedSize: selectedSize ?? this.selectedSize,
        selectedRange: selectedRange ?? this.selectedRange,
      );
}
