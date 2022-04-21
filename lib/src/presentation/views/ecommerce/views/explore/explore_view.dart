import 'package:flutter/material.dart';
import 'package:flutter_apps/src/data/usecase/product.dart';
import 'package:flutter_apps/src/presentation/core/animations/tween_animations.dart';
import 'package:flutter_apps/src/presentation/core/routes/router.dart';
import 'package:flutter_apps/src/presentation/core/utils/snack_bar_app.dart';
import 'package:flutter_apps/src/presentation/views/ecommerce/views/explore/cubit/explore_cubit.dart';
import 'package:flutter_apps/src/presentation/views/ecommerce/views/explore/for_you_widget.dart';
import 'package:flutter_apps/src/presentation/views/ecommerce/views/explore/product_cart.dart';
import 'package:flutter_apps/src/presentation/views/ecommerce/views/explore/product_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final router = AppRouter.of(context);
    return BlocProvider(
      create: (context) => ExploreCubit(
        productUse: ProductUseCase(),
        scrollController: ScrollController(),
      )..init(),
      child: BlocBuilder<ExploreCubit, ExploreState>(
        builder: (context, state) {
          final cubit = context.read<ExploreCubit>();
          return CustomScrollView(
            controller: cubit.scrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: 300.0,
                elevation: 0,
                pinned: true,
                floating: true,
                stretch: true,
                backgroundColor: Colors.grey.shade50,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  titlePadding: const EdgeInsets.only(left: 20, right: 30, bottom: 100),
                  stretchModes: const [
                    StretchMode.zoomBackground,
                    // StretchMode.fadeTitle
                  ],
                  title: AnimatedOpacity(
                    opacity: state.isScrolled ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 500),
                    child: const FadeAnimation(
                      delay: 1,
                      child: Text(
                        "Find your 2021 Collections",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                        ),
                      ),
                    ),
                  ),
                  background: Image.asset(
                    "assets/ecommerce/images/background.png",
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: AppBar(
                  toolbarHeight: 70,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: Row(
                    children: [
                      Expanded(
                        child: FadeAnimation(
                          delay: 1.4,
                          child: SizedBox(
                            height: 50,
                            child: TextField(
                              readOnly: true,
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 20,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(Icons.search, color: Colors.black),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Search e.g Cotton Sweatshirt",
                                hintStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      FadeAnimation(
                        delay: 1.5,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () {
                              showFilterModal(context);
                            },
                            icon: const Icon(
                              Icons.filter_list,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      height: 330,
                      child: Column(
                        children: [
                          FadeAnimation(
                            delay: 1.4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Popular Products',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 20.0),
                                  child: Text(
                                    'See all ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                                return ProductCart(
                                  product: state.products[index],
                                  onPressed: () {
                                    cubit.selectProduct(state.products[index]);
                                    router.push(
                                      BlocProvider.value(
                                        value: cubit,
                                        child: const ProductView(),
                                      ),
                                    );
                                  },
                                  addCart: () {
                                    cubit.selectProduct(state.products[index]);
                                    addToCartModal(context);
                                  },
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      height: 180,
                      child: Column(
                        children: [
                          FadeAnimation(
                            delay: 1.4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'For You',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 20.0),
                                  child: Text(
                                    'See all ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                                return ForYouWidget(product: state.products[index]);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      height: 330,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Winter Collection',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 20.0),
                                child: Text(
                                  'See all ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                                return ProductCart(
                                  product: state.products[index],
                                  onPressed: () {
                                    cubit.selectProduct(state.products[index]);
                                    router.push(
                                      BlocProvider.value(
                                        value: cubit,
                                        child: const ProductView(),
                                      ),
                                    );
                                  },
                                  addCart: () {
                                    cubit.selectProduct(state.products[index]);
                                    addToCartModal(context);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      height: 330,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Cotton Collection',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 20.0),
                                child: Text(
                                  'See all ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ListView.builder(
                              reverse: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                                return ProductCart(
                                  product: state.products[index],
                                  onPressed: () {
                                    cubit.selectProduct(state.products[index]);
                                    router.push(
                                      BlocProvider.value(
                                        value: cubit,
                                        child: const ProductView(),
                                      ),
                                    );
                                  },
                                  addCart: () {
                                    cubit.selectProduct(state.products[index]);
                                    addToCartModal(context);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  showFilterModal(BuildContext context) {
    final cubit = context.read<ExploreCubit>();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return BlocProvider.value(
          value: cubit,
          child: Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Filter',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      minWidth: 40,
                      height: 40,
                      color: Colors.grey.shade300,
                      elevation: 0,
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Color",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cubit.colors.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          cubit.selectedColor(index);
                        },
                        child: BlocBuilder<ExploreCubit, ExploreState>(
                          builder: (context, state) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: state.selectedColor == index
                                    ? cubit.colors[index]
                                    : cubit.colors[index].withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              width: 40,
                              height: 40,
                              child: Center(
                                child: state.selectedColor == index
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      )
                                    : const SizedBox.shrink(),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Size',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cubit.size.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          cubit.selectedSize(index);
                        },
                        child: BlocBuilder<ExploreCubit, ExploreState>(
                          builder: (context, state) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: cubit.state.selectedSize == index ? Colors.yellow[800] : Colors.grey.shade200,
                                shape: BoxShape.circle,
                              ),
                              width: 40,
                              height: 40,
                              child: Center(
                                child: Text(
                                  cubit.size[index],
                                  style: TextStyle(
                                    color: cubit.state.selectedSize == index ? Colors.white : Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                // Slider Price Renge filter
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Price Range',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    BlocBuilder<ExploreCubit, ExploreState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '\$ ${state.selectedRange.start.toStringAsFixed(2)}',
                              style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                            ),
                            Text(" - ", style: TextStyle(color: Colors.grey.shade500)),
                            Text(
                              '\$ ${state.selectedRange.end.toStringAsFixed(2)}',
                              style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<ExploreCubit, ExploreState>(
                  builder: (context, state) {
                    return RangeSlider(
                      values: state.selectedRange,
                      min: 0.00,
                      max: 2000.00,
                      divisions: 100,
                      inactiveColor: Colors.grey.shade300,
                      activeColor: Colors.yellow[800],
                      labels: RangeLabels(
                        '\$ ${state.selectedRange.start.toStringAsFixed(2)}',
                        '\$ ${state.selectedRange.end.toStringAsFixed(2)}',
                      ),
                      onChanged: (RangeValues values) {
                        cubit.setRangeValue(values);
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50.0,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Filter",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.yellow[800],
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  addToCartModal(BuildContext context) {
    final cubit = context.read<ExploreCubit>();
    return showModalBottomSheet(
      context: context,
      transitionAnimationController: AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this,
      ),
      builder: (context) => BlocProvider.value(
        value: cubit,
        child: Container(
          height: 350,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Color",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cubit.colors.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        cubit.selectedColor(index);
                      },
                      child: BlocBuilder<ExploreCubit, ExploreState>(
                        builder: (context, state) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: state.selectedColor == index
                                  ? cubit.colors[index]
                                  : cubit.colors[index].withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            width: 40,
                            height: 40,
                            child: Center(
                              child: state.selectedColor == index
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Size",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cubit.size.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        cubit.selectedSize(index);
                      },
                      child: BlocBuilder<ExploreCubit, ExploreState>(
                        builder: (context, state) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: state.selectedSize == index ? Colors.yellow[800] : Colors.grey.shade200,
                              shape: BoxShape.circle,
                            ),
                            width: 40,
                            height: 40,
                            child: Center(
                              child: Text(
                                cubit.size[index],
                                style: TextStyle(
                                  color: state.selectedSize == index ? Colors.white : Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50.0,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    AppSnackBar.of(context).success(title: "Item added to cart");
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.yellow[800],
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
