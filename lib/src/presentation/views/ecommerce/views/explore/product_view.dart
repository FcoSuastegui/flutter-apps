import 'package:flutter/material.dart';
import 'package:flutter_apps/src/presentation/views/ecommerce/views/explore/cubit/explore_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ExploreCubit>();
    final product = cubit.state.product!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.6,
            elevation: 0,
            snap: true,
            floating: true,
            stretch: true,
            backgroundColor: Colors.grey.shade50,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
              ],
              background: Image.network(
                product.imageURL,
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(45),
              child: Transform.translate(
                offset: const Offset(0, 1),
                child: Container(
                  height: 45,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 50,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: MediaQuery.of(context).size.height * 0.60,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              product.brand,
                              style: TextStyle(
                                color: Colors.orange.shade400,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "\$ " + product.price.toString() + '.00',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Take a break from jeans with the parker long straight pant. These lightweight, pleat front pants feature a flattering high waist and loose, straight legs.",
                      style: TextStyle(
                        height: 1.5,
                        color: Colors.grey.shade800,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Color",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 18,
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
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: cubit.state.selectedColor == index
                                    ? cubit.colors[index]
                                    : cubit.colors[index].withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              width: 40,
                              height: 40,
                              child: Center(
                                child: cubit.state.selectedColor == index
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      )
                                    : const SizedBox.shrink(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Size',
                      style: TextStyle(color: Colors.grey.shade400, fontSize: 18),
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
                            child: AnimatedContainer(
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
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      height: 50,
                      elevation: 0,
                      splashColor: Colors.yellow[700],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: Colors.yellow[800],
                      child: const Center(
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
