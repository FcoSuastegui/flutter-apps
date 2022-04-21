import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/src/data/model/product.dart';
import 'package:flutter_apps/src/data/usecase/product.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit({
    required ProductUseCase productUse,
    required ScrollController scrollController,
  })  : _productUse = productUse,
        _scrollController = scrollController,
        super(ExploreState());

  final ProductUseCase _productUse;
  final ScrollController _scrollController;
  ScrollController get scrollController => _scrollController;

  List<String> size = [
    "S",
    "M",
    "L",
    "XL",
  ];

  List<Color> colors = [
    Colors.black,
    Colors.purple,
    Colors.orange.shade200,
    Colors.blueGrey,
    const Color(0xFFFFC1D9),
  ];

  Future<void> init() async {
    final lists = await _productUse.getProducts(1);
    _scrollController.addListener(_listenToScrollChange);
    emit(state.copyWith(products: lists.itemList));
  }

  void selectedColor(int index) {
    emit(state.copyWith(selectedColor: index));
  }

  void selectedSize(int index) {
    emit(state.copyWith(selectedSize: index));
  }

  void setRangeValue(RangeValues values) {
    emit(state.copyWith(selectedRange: values));
  }

  void selectProduct(ProductModel product) {
    emit(state.copyWith(product: product));
  }

  void _listenToScrollChange() {
    emit(state.copyWith(isScrolled: _scrollController.offset >= 100.0));
  }
}
