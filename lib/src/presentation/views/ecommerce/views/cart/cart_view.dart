import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/src/data/model/product.dart';
import 'package:flutter_apps/src/data/usecase/product.dart';
import 'package:flutter_apps/src/presentation/core/animations/tween_animations.dart';
import 'package:flutter_apps/src/presentation/core/routes/router.dart';
import 'package:flutter_apps/src/presentation/core/utils/helper.dart';
import 'package:flutter_apps/src/presentation/views/ecommerce/views/cart/cart_payment_view.dart';
import 'package:flutter_apps/src/presentation/views/ecommerce/views/cart/cart_product_view.dart';
import 'package:flutter_apps/src/presentation/views/ecommerce/views/cart/cubit/cart_cubit.dart';
import 'package:flutter_apps/src/presentation/widgets/slivers/refresh_sliver_scroll.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(
        pagingController: PagingController(firstPageKey: 1),
        productUse: ProductUseCase(),
      )..init(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('My Cart', style: TextStyle(color: Colors.black)),
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final cubit = context.read<CartCubit>();
            final pagingController = cubit.pagingController;

            return RefreshSliverScrollView(
              onRefresh: () => pagingController.refresh(),
              slivers: [
                PagedSliverList.separated(
                  pagingController: pagingController,
                  builderDelegate: PagedChildBuilderDelegate<ProductModel>(
                    itemBuilder: (context, product, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: FadeAnimation(
                        delay: 1.4,
                        child: Slidable(
                          actionPane: const SlidableDrawerActionPane(),
                          secondaryActions: [
                            MaterialButton(
                              color: Colors.red.withOpacity(0.15),
                              elevation: 0,
                              height: 60,
                              minWidth: 60,
                              shape: const CircleBorder(),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 30,
                              ),
                              onPressed: () {},
                            ),
                          ],
                          child: _CartItem(product: product, index: index),
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 0,
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 30),
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FadeAnimation(
                  delay: 1.2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Shipping', style: TextStyle(fontSize: 20)),
                        BlocBuilder<CartCubit, CartState>(
                          builder: (context, state) {
                            return Text(
                              Helper.moneyFormat(state.subTotal),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                FadeAnimation(
                  delay: 1.3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10,
                    ),
                    child: DottedBorder(
                      color: Colors.grey.shade400,
                      dashPattern: const [10, 10],
                      padding: const EdgeInsets.all(0),
                      child: Container(),
                    ),
                  ),
                ),
                FadeAnimation(
                  delay: 1.3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Total', style: TextStyle(fontSize: 20)),
                        BlocBuilder<CartCubit, CartState>(
                          builder: (context, state) {
                            return Text(
                              Helper.moneyFormat(state.total),
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                FadeAnimation(
                  delay: 1.4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: MaterialButton(
                      onPressed: () {
                        AppRouter.of(context).push(
                          const CartPaymentView(),
                        );
                      },
                      height: 50,
                      elevation: 0,
                      splashColor: Colors.yellow[700],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: Colors.yellow[800],
                      child: const Center(
                        child: Text(
                          "Checkout",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CartItem extends StatelessWidget {
  const _CartItem({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final ProductModel product;
  final int index;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CartCubit>();
    final router = AppRouter.of(context);

    return GestureDetector(
      onTap: () {
        cubit.selectProduct(product);
        router.push(
          BlocProvider.value(
            value: cubit,
            child: const CartProductView(),
          ),
        );
      },
      child: Container(
        // margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(0, 2),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                product.imageURL,
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.brand,
                  style: TextStyle(
                    color: Colors.orange.shade400,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  Helper.moneyFormat(product.price),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                minWidth: 10,
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  if (cubit.state.cartItemCount[index] > 1) {
                    cubit.setItemCount(index, -1);
                    cubit.setTotal(product.price, false);
                  }
                },
                shape: const CircleBorder(),
                child: Icon(
                  Icons.remove_circle_outline,
                  color: Colors.grey.shade400,
                  size: 30,
                ),
              ),
              Center(
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Text(
                      state.cartItemCount[index].toString(),
                      style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                    );
                  },
                ),
              ),
              MaterialButton(
                padding: const EdgeInsets.all(0),
                minWidth: 10,
                splashColor: Colors.yellow[700],
                onPressed: () {
                  cubit.setItemCount(index, 1);
                  cubit.setTotal(product.price, true);
                },
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.add_circle,
                  size: 30,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
