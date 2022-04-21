import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/src/data/model/product.dart';
import 'package:flutter_apps/src/data/usecase/product.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({
    required PagingController<int, ProductModel> pagingController,
    required ProductUseCase productUse,
  })  : _pagingController = pagingController,
        _productUse = productUse,
        super(CartState());

  final PagingController<int, ProductModel> _pagingController;
  PagingController<int, ProductModel> get pagingController => _pagingController;

  final ProductUseCase _productUse;

  static const _pageSize = 10;

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
    _pagingController.addPageRequestListener(getProjects);
  }

  Future<void> getProjects(int pageKey) async {
    emit(state.copyWith(cartItemCount: [1, 1, 1, 1]));
    final list = await _productUse.getProducts(pageKey);
    double total = 0;
    double subTotal = 0;

    if (list.message.isNotEmpty) {
      _pagingController.error = list.message;
      return;
    }
    int index = 0;
    for (var product in list.itemList) {
      subTotal += product.price * state.cartItemCount[index];
      index++;
    }

    total = subTotal * 1.16;
    emit(state.copyWith(total: total, subTotal: subTotal, cartItemCount: [1, 1, 1, 1]));

    list.itemList.length <= _pageSize
        ? _pagingController.appendLastPage(list.itemList)
        : _pagingController.appendPage(list.itemList, pageKey + 1);
  }

  setItemCount(int index, int count) {
    List<int> items = state.cartItemCount;
    items[index] = items[index] + count;
    state.copyWith(cartItemCount: items);
  }

  setTotal(int newSubTotal, bool operation) {
    double subTotal = operation ? state.subTotal + newSubTotal : state.subTotal - newSubTotal;
    double total = subTotal * 1.16;
    emit(state.copyWith(total: total, subTotal: subTotal));
  }

  void selectedColor(int index) {
    emit(state.copyWith(selectedColor: index));
  }

  void selectedSize(int index) {
    emit(state.copyWith(selectedSize: index));
  }

  void selectProduct(ProductModel product) {
    emit(state.copyWith(product: product));
  }

  void dispose() {
    _pagingController.dispose();
  }
}
