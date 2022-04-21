import 'package:flutter/material.dart';
import 'package:flutter_apps/src/data/model/product.dart';
import 'package:flutter_apps/src/presentation/core/animations/tween_animations.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({
    Key? key,
    required this.product,
    this.addCart,
    this.onPressed,
  }) : super(key: key);

  final ProductModel product;
  final VoidCallback? addCart;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: FadeAnimation(
        delay: 1.5,
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            margin: const EdgeInsets.only(right: 20, bottom: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(5, 10),
                  blurRadius: 15,
                  color: Colors.grey.shade200,
                )
              ],
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            product.imageURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Add to cart button
                      Positioned(
                        right: 5,
                        bottom: 5,
                        child: MaterialButton(
                          color: Colors.black,
                          minWidth: 45,
                          height: 45,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                          ),
                          onPressed: addCart,
                          //addToCartModal();,
                          padding: const EdgeInsets.all(5),
                          child: const Center(
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  product.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.brand,
                      style: TextStyle(
                        color: Colors.orange.shade400,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "\$ " + product.price.toString() + '.00',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
